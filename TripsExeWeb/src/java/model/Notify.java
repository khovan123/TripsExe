package model;

import java.util.*;

public class Notify {

    private String notifyId;
    private String userIdSend;
    private String userIdReceive;
    private Date date;
    private String text;
    private boolean markRead;

    public Notify() {
    }

    public Notify(String notifyId, String userIdSend, String userIdReceive, Date date, String text, boolean markRead) {
        this.notifyId = notifyId;
        this.userIdSend = userIdSend;
        this.userIdReceive = userIdReceive;
        this.date = date;
        this.text = text;
        this.markRead = markRead;
    }

    public String getNotifyId() {
        return notifyId;
    }

    public void setNotifyId(String notifyId) {
        this.notifyId = notifyId;
    }

    public String getUserIdSend() {
        return userIdSend;
    }

    public void setUserIdSend(String userIdSend) {
        this.userIdSend = userIdSend;
    }

    public String getUserIdReceive() {
        return userIdReceive;
    }

    public void setUserIdReceive(String userIdReceive) {
        this.userIdReceive = userIdReceive;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isMarkRead() {
        return markRead;
    }

    public void setMarkRead(boolean markRead) {
        this.markRead = markRead;
    }

}
