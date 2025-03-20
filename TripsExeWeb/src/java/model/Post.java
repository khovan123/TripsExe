package model;

import java.sql.Date;

public class Post {

    private int postId;
    private int userId;
    private String content;
    private String imageUrl;
    private Date postDate;
    private CommentsOfPost comments;
    private LikesOfPost likes;

    public Post() {
        this.imageUrl = null;
        this.postDate = null;
        this.comments = new CommentsOfPost();
        this.likes = new LikesOfPost();
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

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
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

    public CommentsOfPost getComments() {
        return comments;
    }

    public LikesOfPost getLikes() {
        return likes;
    }
}
