package model;

import java.sql.Date;

public class User {

    private String userID;
    private String username;
    private String password;
    private String email;
    private String avatar;
    private Date premiumExpirationDate;
    private boolean premiumAccount;
    private PostsOfUser postList;
    private Friends friends;
    private NotifyOfUser notifyList;
    
    public User(){
    
    }
    
    public User(String userID, String username, String password, String email, String avatar, Date premiumExpirationDate, boolean premiumAccount, PostsOfUser postList, Friends friends, NotifyOfUser notifyList) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.avatar = avatar;
        this.premiumExpirationDate = premiumExpirationDate;
        this.premiumAccount = premiumAccount;
        this.postList = postList;
        this.friends = friends;
        this.notifyList = notifyList;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public void setPostList(PostsOfUser postList) {
        this.postList = postList;
    }

    public Friends getFriends() {
        return friends;
    }

    public void setFriends(Friends friends) {
        this.friends = friends;
    }

    public NotifyOfUser getNotifyList() {
        return notifyList;
    }

    public void setNotifyList(NotifyOfUser notifyList) {
        this.notifyList = notifyList;
    }

    

}
