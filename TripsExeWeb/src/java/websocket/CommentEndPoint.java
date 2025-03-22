package websocket;

import CRUD.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.websocket.*;
import jakarta.websocket.server.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import model.*;

@ServerEndpoint("/commentendpoint/{postId}")
public class CommentEndPoint {

    private static final Map<Integer, Map<Session, Integer>> posts = Collections.synchronizedMap(new HashMap<>());
    private CommentDAO commentDAO = new CommentDAO();
    private static final ObjectMapper objectMapper = new ObjectMapper();
    private static final int PAGE_SIZE = 5;

    @OnOpen
    public void onOpen(Session session, @PathParam("postId") String postId) throws IOException {
        System.out.println("WebSocket opened for postId: " + postId);
        int postIdNum;
        try {
            postIdNum = Integer.parseInt(postId);
        } catch (NumberFormatException e) {
            System.err.println("Invalid postId: " + postId);
            session.close();
            return;
        }
        Map<Session, Integer> postClients = posts.computeIfAbsent(postIdNum, k -> Collections.synchronizedMap(new HashMap<>()));
        postClients.put(session, postIdNum);
        posts.put(postIdNum, postClients);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("postId") String postId) throws IOException {
        int postIdNum = Integer.parseInt(postId);
        if (message.matches("^userId=([^&]+)&fullName=([^&]+)$")) {
            String[] data = message.split("&");
            String userId = data[0].split("=")[1].trim();
            String fullName = data[1].split("=")[1].trim();
            session.getUserProperties().put("userId", userId);
            session.getUserProperties().put("fullName", fullName);
            return;
        }
        if (message.startsWith("load:")) {
            try {
                int offset = Integer.parseInt(message.split(":")[1]);
                List<Comment> history = commentDAO.getCommentHistory(postIdNum, offset, PAGE_SIZE);
                for (Comment cmt : history) {
                    String jsonMessage = objectMapper.writeValueAsString(cmt);
                    session.getBasicRemote().sendText(jsonMessage);
                }

                int totalComments = commentDAO.getTotalComments(postIdNum);
                int remaining = totalComments - (offset + history.size());
                session.getBasicRemote().sendText("remainingCmt:" + remaining);
            } catch (SQLException e) {
                System.err.println("Error fetching comment history: " + e.getMessage());
            }
            return;
        }
        String userId = (String) session.getUserProperties().get("userId");
        String fullName = (String) session.getUserProperties().get("fullName");
        if (userId == null || fullName == null) {
            session.getBasicRemote().sendText("Something went wrong");
            return;
        }

        try {
            String[] msgdata = message.split("&&", 2);
            boolean containsImg = msgdata.length == 2;
            Comment cmt = new Comment();
            cmt.setText(containsImg ? msgdata[0] : message);
            cmt.setPostId(postIdNum);
            cmt.setUserId(Integer.parseInt(userId));
            cmt.setFullName(fullName);
            cmt.setImageUrl(containsImg ? msgdata[1] : null);
            commentDAO.addComment(cmt);
            String jsonMessage = objectMapper.writeValueAsString(cmt);
            Map<Session, Integer> postClients = posts.get(postIdNum);
            if (postClients != null) {
                for (Session client : postClients.keySet()) {
                    if (client.isOpen()) {
                        client.getBasicRemote().sendText(jsonMessage);
                    }
                }
            }
        } catch (IOException | NumberFormatException | SQLException e) {
            System.err.println("Error saving comment to database: " + e.getMessage());
            session.getBasicRemote().sendText("Error: Could not save comment, because: " + e.getMessage());
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("postId") String postId) {
        System.out.println("WebSocket closed for postId: " + postId);
        int postIdNum = Integer.parseInt(postId);
        Map<Session, Integer> postClients = posts.get(postIdNum);
        if (postClients != null) {
            postClients.remove(session);
            if (postClients.isEmpty()) {
                posts.remove(postIdNum);
            }
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("WebSocket error: " + throwable.getMessage());
        throwable.printStackTrace();
    }
}
