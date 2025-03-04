package model;

import java.sql.Date;

public class Post {

    private String postId;
    private String title;
    private Date postDate;
    private String content;
    private String imageUrl;
    private PostComment comments;
    private PostLike likes;

    public Post() {
    }

    public Post(String postId, String title, Date postDate, String content, String imageUrl) {
        this.postId = postId;
        this.title = title;
        this.postDate = postDate;
        this.content = content;
        this.imageUrl = imageUrl;
        this.comments = new PostComment();
        this.likes = new PostLike();
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
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

    public PostComment getComments() {
        return comments;
    }

    public PostLike getLikes() {
        return likes;
    }
}
