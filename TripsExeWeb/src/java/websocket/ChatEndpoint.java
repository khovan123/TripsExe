package websocket;

import CRUD.*;
import jakarta.websocket.*;
import jakarta.websocket.server.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import model.*;

@ServerEndpoint("/chatendpoint/{roomId}")
public class ChatEndpoint {

    private static final Map<String, Map<Session, String>> rooms = Collections.synchronizedMap(new HashMap<>());
    private ChatDAO chatDAO = new ChatDAO();

    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") String roomId) {
        Map<Session, String> roomClients = rooms.computeIfAbsent(roomId, k -> Collections.synchronizedMap(new HashMap<>()));
        roomClients.put(session, roomId);
        rooms.put(roomId, roomClients);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("roomId") String roomId) throws IOException {
        if (message.matches("^userId=([^&]+)&fullName=([^&]+)$")) {
            String[] data = message.split("&");
            String userId = data[0].split("=")[1].trim();
            String fullName = data[1].split("=")[1].trim();
            session.getUserProperties().put("userId", userId);
            session.getUserProperties().put("fullName", fullName);
            try {
                List<Message> history = chatDAO.getMessageHistory(roomId);
                history.forEach(msg -> {
                    try {
                        String formattedMessage = msg.getUserId() + ":" + msg.getContent();
                        session.getBasicRemote().sendText(formattedMessage);
                    } catch (IOException ex) {
                        System.err.println("Error sending message: " + ex.getMessage());
                    }
                });
            } catch (SQLException e) {
                System.err.println("Error fetching message history: " + e.getMessage());
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
            Message msg = new Message();
            msg.setContent(message);
            msg.setRoomId(roomId);
            msg.setUserId(Integer.parseInt(userId));
            msg.setFullName(fullName);
            chatDAO.addMessage(msg);

            String formattedMessage = userId + ":" + message;
            Map<Session, String> roomClients = rooms.get(roomId);
            if (roomClients != null) {
                for (Session client : roomClients.keySet()) {
                    if (client.isOpen()) {
                        client.getBasicRemote().sendText(formattedMessage);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error saving message to database: " + e.getMessage());
            session.getBasicRemote().sendText("Error: Could not save message");
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("roomId") String roomId) {
        Map<Session, String> roomClients = rooms.get(roomId);
        if (roomClients != null) {
            roomClients.remove(session);
            if (roomClients.isEmpty()) {
                rooms.remove(roomId);
            }
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }
}