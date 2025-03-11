package model;

import java.util.*;

public class Notify {

    private int notifyId;
    private int senderId;
    private int receiverId;
    private Date notificationDate;
    private String messageContent;
    private boolean markRead;

    public Notify() {
    }

    public Notify(int notifyId, int senderId, int receiverId, Date notificationDate, String messageContent) {
        this.notifyId = notifyId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.notificationDate = notificationDate;
        this.messageContent = messageContent;
        this.markRead = false;
    }

    public int getNotifyId() {
        return notifyId;
    }

    public void setNotifyId(int notifyId) {
        this.notifyId = notifyId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
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

    public boolean isMarkRead() {
        return markRead;
    }

    public void setMarkRead(boolean markRead) {
        this.markRead = markRead;
    }

    
}
