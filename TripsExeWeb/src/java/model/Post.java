package model;

import java.sql.Date;

public class Post {

    private String postId;
    private String title;
    private Date date;
    private String text;
    private String urlImage;
    private CommentsOfPost comments;
    private LikesOfPost likes;

    public Post() {
    }

    public Post(String postId, String title, Date date, String text, String urlImage) {
        this.postId = postId;
        this.title = title;
        this.date = date;
        this.text = text;
        this.urlImage = urlImage;
        this.comments = new CommentsOfPost();
        this.likes = new LikesOfPost();
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

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public CommentsOfPost getComments() {
        return comments;
    }

    public LikesOfPost getLikes() {
        return likes;
    }

}
