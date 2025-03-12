CREATE DATABASE tripsExe
GO 

USE tripsExe
GO

CREATE TABLE UserTBL (
    userId INT IDENTITY(1,1),
    username VARCHAR(50) NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    email VARCHAR(100) NOT NULL, 
    avatar VARCHAR(255), -- img dang link, duong dan
    premiumExpirationDate DATETIME, 
    PremiumAccount BIT DEFAULT 0, 

    CONSTRAINT PK_Users PRIMARY KEY (userId),
    CONSTRAINT UQ_User_Email UNIQUE (email), -- chi co mot email k duoc trung lap 
    CONSTRAINT UQ_User_Name UNIQUE (username) -- tuong tu voi email khong duoc trung lap
);
GO

CREATE TABLE PostTBL (
    postId INT IDENTITY(1,1), 
	userId INT NOT NULL,
    title NVARCHAR(255) NOT NULL,
    postDate DATETIME NOT NULL DEFAULT GETDATE(), 
    content NVARCHAR(MAX) NOT NULL,
    imageUrl VARCHAR(255), -- img dang link, duong dan
	
    CONSTRAINT PK_Posts PRIMARY KEY (postId),
    CONSTRAINT FK_Posts_User FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);
GO

CREATE TABLE NotifyTBL (
    notifyId INT IDENTITY(1,1),
    userId INT NOT NULL,
    notificationDate DATETIME, 
    messageContent NVARCHAR(MAX),  
    markRead BIT DEFAULT 0,

    CONSTRAINT PK_Notifies PRIMARY KEY (notifyId),
    CONSTRAINT FK_Notifies_UserId FOREIGN KEY (userId) REFERENCES Users(userID),

);
GO

CREATE TABLE CommentTBL (
    commentId INT IDENTITY(1,1),
    --userId INT NOT NULL,
	postID INT NOT NULL,
    commentDate DATETIME NOT NULL DEFAULT GETDATE(), 
    content NVARCHAR(MAX), 
    imageUrl VARCHAR(255), -- img dang link, duong dan

    CONSTRAINT PK_Comments PRIMARY KEY (commentId),
    --CONSTRAINT FK_Comments_User FOREIGN KEY (userId) REFERENCES Users(userId),
	CONSTRAINT FK_Comments_Post FOREIGN KEY (postId) REFERENCES Posts(postId)
);
GO

CREATE TABLE FriendsTBL (
    userId1 INT,
    userId2 INT,

    CONSTRAINT PK_Friends PRIMARY KEY (userId1, userId2),
    CONSTRAINT FK_Friends_User1 FOREIGN KEY (userId1) REFERENCES Users(userId),
    CONSTRAINT FK_Friends_User2 FOREIGN KEY (userId2) REFERENCES Users(userId)
);
GO


--CREATE TABLE Messages (
    --messageID INT IDENTITY(1,1), 
    --senderID INT NOT NULL,
    --recieverID INT NOT NULL,
    --messageDate DATETIME NOT NULL DEFAULT GETDATE(), 
    --content NVARCHAR(MAX), 
    --img VARCHAR(100),
	--markRead BIT DEFAULT 0,

    --CONSTRAINT PK_Messages PRIMARY KEY (messageID),

    --CONSTRAINT FK_Messages_User1 FOREIGN KEY (senderID) REFERENCES Users(userID) ,
    --CONSTRAINT FK_Messages_User2 FOREIGN KEY (recieverID) REFERENCES Users(userID) ,

    --CONSTRAINT CHK_Messages_SelfSend CHECK (senderID <> recieverID)
--);
--GO


ALTER TABLE CommentTBL DROP CONSTRAINT FK_Comments_Post;
ALTER TABLE NotifyTBL DROP CONSTRAINT FK_Notifies_UserId;
ALTER TABLE FriendsTBL DROP CONSTRAINT FK_Friends_User1;
ALTER TABLE FriendsTBL DROP CONSTRAINT FK_Friends_User2;
ALTER TABLE PostTBL DROP CONSTRAINT FK_Posts_User;

DROP TABLE IF EXISTS CommentTBL;
DROP TABLE IF EXISTS NotifyTBL;
DROP TABLE IF EXISTS FriendsTBL;
DROP TABLE IF EXISTS PostTBL;
DROP TABLE IF EXISTS UserTBL;
GO