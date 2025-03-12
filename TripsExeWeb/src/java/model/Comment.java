package model;

import java.util.*;

public class Comment {

    private int commentId;
    private int postId;
    private int userId;
    private Date commentDate;
    private String content;
    private String imageUrl;

    public Comment() {
    }

    public Comment(int postId, int userId, Date commentDate, String content, String imageUrl) {
        this.postId = postId;
        this.userId = userId;
        this.commentDate = commentDate;
        this.content = content;
        this.imageUrl = imageUrl;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    @Override
    public String toString() {
        return "Comment{" + "commentId=" + commentId + ", postId=" + postId + ", userId=" + userId + ", commentDate=" + commentDate + ", content=" + content + ", imageUrl=" + imageUrl + '}';
    }
}
