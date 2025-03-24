package websocket;

import CRUD.*;
import com.fasterxml.jackson.databind.ObjectMapper;
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
    private static final ObjectMapper objectMapper = new ObjectMapper();

    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") String roomId) {
        Map<Session, String> roomClients = rooms.computeIfAbsent(roomId, k -> Collections.synchronizedMap(new HashMap<>()));
        roomClients.put(session, roomId);
        rooms.put(roomId, roomClients);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("roomId") String roomId) throws IOException {
        if (message.startsWith("{\"load\":")) {
            try {
                List<Message> history = chatDAO.getMessageHistory(roomId);
                history.forEach(msg -> {
                    try {
                        session.getBasicRemote().sendText(objectMapper.writeValueAsString(msg));
                    } catch (IOException ex) {
                        System.err.println("Error sending message: " + ex.getMessage());
                    }
                });
            } catch (SQLException e) {
                System.err.println("Error fetching message history: " + e.getMessage());
            }
        }

        if (message.startsWith("{\"message\":")) {
            Map<String, Map<String, Object>> messageWrapper = objectMapper.readValue(message, Map.class);
            Map<String, Object> messageData = messageWrapper.get("message");
            try {
                Message msg = new Message();
                msg.setContent((String) messageData.get("content"));
//                msg.setRoomId((String) messageData.get("roomId"));
                msg.setRoomId(roomId);
                msg.setUserId(Integer.parseInt((String) messageData.get("userId")));
                msg.setFullName((String) messageData.get("fullName"));
                msg.setImageUrl((String) messageData.get("imageUrl"));
                chatDAO.addMessage(msg);

                Map<Session, String> roomClients = rooms.get(roomId);
                if (roomClients != null) {
                    for (Session client : roomClients.keySet()) {
                        if (client.isOpen()) {
                            client.getBasicRemote().sendText(objectMapper.writeValueAsString(msg));
                        }
                    }
                }
            } catch (SQLException e) {
                System.err.println("Error saving message to database: " + e.getMessage());
                session.getBasicRemote().sendText("Error: Could not save message");
            }
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
