package model;

import java.util.*;

public class Comment {

    private String commentId;
    private String userId;
    private Date commentDate;
    private String content;
    private String imageUrl;

    public Comment(String commentId, String userId, Date commentDate, String content, String imageUrl) {
        this.commentId = commentId;
        this.userId = userId;
        this.commentDate = commentDate;
        this.content = content;
        this.imageUrl = imageUrl;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
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
}
