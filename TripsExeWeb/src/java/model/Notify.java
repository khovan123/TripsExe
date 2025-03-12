package model;

import java.util.Date;

public class Notify {
    private int notifyId;
    private int userId; 
    private Date notificationDate;
    private String messageContent;
    private boolean markRead;

    public Notify() {
    }

    public Notify(int notifyId, int userId, Date notificationDate, String messageContent, boolean markRead) {
        this.notifyId = notifyId;
        this.userId = userId;
        this.notificationDate = notificationDate;
        this.messageContent = messageContent;
        this.markRead = markRead;
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
