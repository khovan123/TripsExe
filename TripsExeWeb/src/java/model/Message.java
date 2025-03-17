package model;

import java.sql.Date;

public class Message {

    private int messageId;
    private int userId;
    private String roomId;
    private String fullName;
    private String content;
    private String imageUrl;
    private Date timestamp;

    public Message() {
        this.messageId = -1;
        this.imageUrl = null;
        this.timestamp = null;
    }

    public Message(int messageId, int userId, String roomId, String fullName, String content, String imageUrl, Date timestamp) {
        this.messageId = messageId;
        this.userId = userId;
        this.roomId = roomId;
        this.fullName = fullName;
        this.content = content;
        this.imageUrl = imageUrl;
        this.timestamp = timestamp;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "Message{" + "messageId=" + messageId + ", userId=" + userId + ", roomId=" + roomId + ", fullName=" + fullName + ", content=" + content + ", imageUrl=" + imageUrl + ", timestamp=" + timestamp + '}';
    }
}
