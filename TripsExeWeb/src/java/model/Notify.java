package model;

import java.util.*;

public class Notify {

    private String notifyId;
    private String senderId;
    private String receiverId;
    private Date notificationDate;
    private String messageContent;
    private boolean isRead;

    public Notify() {
    }

    public Notify(String notifyId, String senderId, String receiverId, Date notificationDate, String messageContent) {
        this.notifyId = notifyId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.notificationDate = notificationDate;
        this.messageContent = messageContent;
        this.isRead = false;
    }

    public String getNotifyId() {
        return notifyId;
    }

    public void setNotifyId(String notifyId) {
        this.notifyId = notifyId;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    public String getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(String receiverId) {
        this.receiverId = receiverId;
    }

    public Date getNotificationDate() {
        return notificationDate;
    }

    public void setNotificationDate(Date notificationDate) {
        this.notificationDate = notificationDate;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }
}
