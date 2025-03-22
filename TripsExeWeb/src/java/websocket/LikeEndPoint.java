package websocket;

import CRUD.*;
import jakarta.websocket.*;
import jakarta.websocket.server.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@ServerEndpoint("/likeendpoint/{postId}")
public class LikeEndPoint {

    private static final Map<Integer, Map<Session, Integer>> posts = Collections.synchronizedMap(new HashMap<>());
    private LikeDAO likeDAO = new LikeDAO();

    @OnOpen
    public void onOpen(Session session, @PathParam("postId") String postId) {
        System.out.println("Like WebSocket opened for postId: " + postId);
        int postIdNum;
        try {
            postIdNum = Integer.parseInt(postId);
        } catch (NumberFormatException e) {
            System.err.println("Invalid postId: " + postId);
            try {
                session.close();
            } catch (IOException ex) {
                System.err.println("Error closing session: " + ex.getMessage());
            }
            return;
        }
        Map<Session, Integer> roomClients = posts.computeIfAbsent(postIdNum, k -> Collections.synchronizedMap(new HashMap<>()));
        roomClients.put(session, postIdNum);
        posts.put(postIdNum, roomClients);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("postId") String postId) throws IOException {
        int postIdNum = Integer.parseInt(postId);

        if (message.matches("^userId=([^&]+)$")) {
            String userId = message.split("=")[1].trim();
            session.getUserProperties().put("userId", userId);
//            try {
//                int likeCount = likeDAO.getLikeCount(postIdNum);
//                session.getBasicRemote().sendText("init:" + likeCount);
//            } catch (SQLException e) {
//                System.err.println("Error fetching like count: " + e.getMessage());
//            }
        }

        String userId = (String) session.getUserProperties().get("userId");
        if (userId == null) {
            session.getBasicRemote().sendText("Error: User not authenticated");
            return;
        }

        try {
            int userIdNum = Integer.parseInt(userId);
            boolean isLiked = likeDAO.isLiked(postIdNum, userIdNum);
            int likeCount;

            if (isLiked) {
                likeDAO.removeLike(postIdNum, userIdNum);
                likeCount = likeDAO.getLikeCount(postIdNum);
            } else {
                likeDAO.addLike(postIdNum, userIdNum);
                likeCount = likeDAO.getLikeCount(postIdNum);
            }

            Map<Session, Integer> postClients = posts.get(postIdNum);
            if (postClients != null) {
                String jsonMessage = "update:" + likeCount + "&liked:" + (isLiked ? "0" : "1");
                for (Session client : postClients.keySet()) {
                    if (client.isOpen()) {
                        client.getBasicRemote().sendText(jsonMessage);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error processing like: " + e.getMessage());
            session.getBasicRemote().sendText("Error: " + e.getMessage());
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("postId") String postId) {
        System.out.println("Like WebSocket closed for postId: " + postId);
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
        System.err.println("Like WebSocket error: " + throwable.getMessage());
        throwable.printStackTrace();
    }
}
