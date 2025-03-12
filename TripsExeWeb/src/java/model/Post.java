package model;

import java.sql.Date;

public class Post {

    private int postId;
    private int userId;
    private String title;
    private Date postDate;
    private String content;
    private String imageUrl;
    private CommentsOfPost comments;
    private LikesOfPost likes;

    public Post() {
    }

    public Post(int postId, int userId, String title, Date postDate, String content, String imageUrl) {
        this.postId = postId;
        this.userId = userId;
        this.title = title;
        this.postDate = postDate;
        this.content = content;
        this.imageUrl = imageUrl;
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
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
