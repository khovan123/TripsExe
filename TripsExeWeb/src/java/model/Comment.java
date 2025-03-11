package model;

import java.util.*;

public class Comment {

<<<<<<< HEAD
    private String commentId;
    private String postId;
=======
    private int commentId;
>>>>>>> 5a292a2b4f53e917af24bdf56d0112a5eca52b6c
    private String userId;
    private Date commentDate;
    private String content;
    private String imageUrl;

<<<<<<< HEAD
    public Comment() {
    }
    

    public Comment(String commentId, String postId, String userId, Date commentDate, String content, String imageUrl) {
=======
    public Comment(int commentId, String userId, Date commentDate, String content, String imageUrl) {
>>>>>>> 5a292a2b4f53e917af24bdf56d0112a5eca52b6c
        this.commentId = commentId;
        this.postId = postId;
        this.userId = userId;
        this.commentDate = commentDate;
        this.content = content;
        this.imageUrl = imageUrl;
    }

<<<<<<< HEAD
    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getCommentId() {
=======
    public int getCommentId() {
>>>>>>> 5a292a2b4f53e917af24bdf56d0112a5eca52b6c
        return commentId;
    }

    public void setCommentId(int commentId) {
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
