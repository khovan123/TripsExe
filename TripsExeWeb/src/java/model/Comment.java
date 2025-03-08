package model;

import java.util.*;

public class Comment {

    private String commentId;
    private String postId;
    private String userId;
    private Date commentDate;
    private String content;
    private String imageUrl;

    public Comment() {
    }
    

    public Comment(String commentId, String postId, String userId, Date commentDate, String content, String imageUrl) {
        this.commentId = commentId;
        this.postId = postId;
        this.userId = userId;
        this.commentDate = commentDate;
        this.content = content;
        this.imageUrl = imageUrl;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
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
