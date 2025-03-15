CREATE TABLE UserTBL (
    userId INT IDENTITY(1,1),
    fullName VARCHAR(255) NOT NULL,
    additionalName VARCHAR(255) NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(20) NULL,
    avatarUrl VARCHAR(255) NULL,
    overview VARCHAR(255) NULL,
    dob DATE NULL,
    gender BIT NULL, -- 0: nu, 1: nam
    premiumExpirationDate DATETIME NULL,
    premiumAccount BIT NULL DEFAULT 0,
    createdAt DATETIME NULL DEFAULT GETDATE(),
    updatedAt DATETIME NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Users PRIMARY KEY (userId),
    CONSTRAINT UQ_User_Email UNIQUE (email),
    CONSTRAINT UQ_User_Phone UNIQUE (phoneNumber),
    CONSTRAINT UQ_User_Name UNIQUE (username)
);


INSERT INTO UserTBL (
    fullName, 
    additionalName, 
    username, 
    password, 
    email, 
    phoneNumber, 
    avatarUrl, 
    overview, 
    dob, 
    gender, 
    premiumExpirationDate, 
    premiumAccount
) VALUES (
    'John Doe',                  -- fullName
    'Johnny',                   -- additionalName
    'johndoe123',              -- username
    'hashedpassword123',       -- password (in reality, this should be properly hashed)
    'john.doe@example.com',    -- email
    '+1234567890',            -- phoneNumber
    'https://example.com/avatar.jpg', -- avatarUrl
    'Software developer',     -- overview
    '1990-05-15',            -- dob
    1,                       -- gender (1 = male)
    '2025-12-31 23:59:59',  -- premiumExpirationDate
    1                       -- premiumAccount
);


CREATE TABLE PostTBL (
    postId INT IDENTITY(1,1), 
	userId INT NOT NULL,
    title NVARCHAR(255) NOT NULL,
    postDate DATETIME NULL DEFAULT GETDATE(), 
    content NVARCHAR(MAX) NOT NULL,
    imageUrl VARCHAR(255) NULL, -- img dang link, duong dan
	
    CONSTRAINT PK_Posts PRIMARY KEY (postId),
    CONSTRAINT FK_Posts_User FOREIGN KEY (userID) REFERENCES UserTBL(userID) ON DELETE CASCADE
);
GO

CREATE TABLE NotifyTBL (
    notifyId INT IDENTITY(1,1),
    userId INT NOT NULL,
    notificationDate DATETIME NULL DEFAULT GETDATE(), 
    messageContent NVARCHAR(MAX) NOT NULL,  
    markRead BIT NULL DEFAULT 0,
    CONSTRAINT PK_Notifies PRIMARY KEY (notifyId),
    CONSTRAINT FK_Notifies_UserId FOREIGN KEY (userId) REFERENCES UserTBL(userID),

);
GO

CREATE TABLE CommentTBL (
    commentId INT IDENTITY(1,1),
    userId INT NOT NULL, --who was comment
	postID INT NOT NULL,
    commentDate DATETIME NULL DEFAULT GETDATE(), 
    content NVARCHAR(MAX) NOT NULL,
    imageUrl VARCHAR(255) NULL, -- img dang link, duong dan

    CONSTRAINT PK_Comments PRIMARY KEY (commentId),
    CONSTRAINT FK_Comments_User FOREIGN KEY (userId) REFERENCES UserTBL(userId),
	CONSTRAINT FK_Comments_Post FOREIGN KEY (postId) REFERENCES PostTBL(postId)
);
GO

CREATE TABLE FriendsTBL (
    userId1 INT NOT NULL,
    userId2 INT NOT NULL,
    CONSTRAINT PK_Friends PRIMARY KEY (userId1, userId2),
    CONSTRAINT FK_Friends_User1 FOREIGN KEY (userId1) REFERENCES UserTBL(userId),
    CONSTRAINT FK_Friends_User2 FOREIGN KEY (userId2) REFERENCES UserTBL(userId)
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