package model;

import java.util.*;

public class Notify {

    private String notifyId;
    private String senderId;
    private String receiverId;
    private Date notifyDate;
    private String content;
    private boolean markRead;

    public Notify() {
    }

    public Notify(String notifyId, String senderId, String receiverId, Date notifyDate, String content, boolean markRead) {
        this.notifyId = notifyId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.notifyDate = notifyDate;
        this.content = content;
        this.markRead = markRead;
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

    public Date getNotifyDate() {
        return notifyDate;
    }

    public void setNotifyDate(Date notifyDate) {
        this.notifyDate = notifyDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isMarkRead() {
        return markRead;
    }

    public void setMarkRead(boolean markRead) {
        this.markRead = markRead;
    }

    
}
