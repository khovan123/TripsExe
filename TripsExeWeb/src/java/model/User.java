package model;

import java.sql.Date;

public class User {

    private int userId;
    private String username;
    private String password;
    private String email;
    private String avatar;
    private Date premiumExpirationDate;
    private boolean premiumAccount;
    private PostsOfUser postList;
    private UserFriend friends;
    private NotifyOfUser notifyList;

    public User() {
    }

    public User(int userId, String username, String password, String email, String avatar) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.avatar = avatar;
        this.premiumExpirationDate = null;
        this.premiumAccount = false;
        this.postList = new PostsOfUser();
        this.friends = new UserFriend();
        this.notifyList = new NotifyOfUser();
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getPremiumExpirationDate() {
        return premiumExpirationDate;
    }

    public void setPremiumExpirationDate(Date premiumExpirationDate) {
        this.premiumExpirationDate = premiumExpirationDate;
    }

    public boolean isPremiumAccount() {
        return premiumAccount;
    }

    public void setPremiumAccount(boolean premiumAccount) {
        this.premiumAccount = premiumAccount;
    }

    public PostsOfUser getPostList() {
        return postList;
    }

    public UserFriend getFriends() {
        return friends;
    }

    public NotifyOfUser getNotifyList() {
        return notifyList;
    }
}
