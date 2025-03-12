package model;

import java.util.*;

public class Notify {

    private int notifyId;
    private int userId;
    private Date notificationDate;
    private String messageContent;
    private boolean markRead;

    public Notify() {
    }

    public Notify(int notifyId, int senderId, int receiverId, Date notificationDate, String messageContent) {
        this.notifyId = notifyId;
        this.userId = userId;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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
