package model;

import java.util.*;

public class Notify {

    private String notifyID;
    private String senderID;
    private String receiverID;
    private Date notifyDate;
    private String content;
    private boolean markRead;

    public Notify() {
    }

    public Notify(String notifyID, String senderID, String receiverID, Date notifyDate, String content, boolean markRead) {
        this.notifyID = notifyID;
        this.senderID = senderID;
        this.receiverID = receiverID;
        this.notifyDate = notifyDate;
        this.content = content;
        this.markRead = markRead;
    }

    public String getNotifyID() {
        return notifyID;
    }

    public void setNotifyID(String notifyID) {
        this.notifyID = notifyID;
    }

    public String getSenderID() {
        return senderID;
    }

    public void setSenderID(String senderID) {
        this.senderID = senderID;
    }

    public String getReceiverID() {
        return receiverID;
    }

    public void setReceiverID(String receiverID) {
        this.receiverID = receiverID;
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
