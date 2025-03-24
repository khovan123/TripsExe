package model;

import java.sql.Date;

public class User {

    private int userId;
    private String username;
    private String password;
    private String email;
    private String phoneNumber;
    private String fullName;
    private String additionalName;
    private String avatarUrl;
    private String overview;
    private Date dob;
    private boolean gender;
    private Date premiumExpirationDate;
    private boolean premiumAccount;
    private int posts;
    private int friends;
    private NotifyOfUser notifyList;

    public User() {
        this.notifyList = new NotifyOfUser();
    }

    public User(String password, String email) {
        this.posts = 0;
        this.password = password;
        this.email = email;
        this.friends = 0;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAdditionalName() {
        return additionalName;
    }

    public void setAdditionalName(String additionalName) {
        this.additionalName = additionalName;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
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

    public NotifyOfUser getNotifyList() {
        return notifyList;
    }

    public int getPosts() {
        return posts;
    }

    public void setPosts(int posts) {
        this.posts = posts;
    }

    public int getFriends() {
        return friends;
    }

    public void setFriends(int friends) {
        this.friends = friends;
    }

}
