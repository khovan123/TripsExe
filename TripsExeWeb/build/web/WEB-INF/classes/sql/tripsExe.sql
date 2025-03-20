CREATE TABLE UserTBL (
    userId INT IDENTITY(1,1),
    username VARCHAR(50) NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    additionalName VARCHAR(255) NULL,
    dob DATE NULL,
    gender BIT NULL, -- 0: nu, 1: nam
    phoneNumber VARCHAR(20) NULL,
    avatarUrl VARCHAR(255) NULL,
    overview VARCHAR(255) NULL,
    premiumExpirationDate DATETIME NULL,
    premiumAccount BIT NULL DEFAULT 0,
    createdAt DATETIME NULL DEFAULT GETDATE(),
    updatedAt DATETIME NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Users PRIMARY KEY (userId),
    CONSTRAINT UQ_User_Email UNIQUE (email),
    CONSTRAINT UQ_User_Phone UNIQUE (phoneNumber),
    CONSTRAINT UQ_User_Name UNIQUE (username)
);

GO
CREATE TABLE FriendTBL (
    userId1 INT NOT NULL,
    userId2 INT NOT NULL,
    CONSTRAINT PK_Friends PRIMARY KEY (userId1, userId2),
    CONSTRAINT FK_Friends_User1 FOREIGN KEY (userId1) REFERENCES UserTBL(userId),
    CONSTRAINT FK_Friends_User2 FOREIGN KEY (userId2) REFERENCES UserTBL(userId)
);

GO
CREATE TABLE Messages (
    messageId INT PRIMARY KEY IDENTITY(1,1),
    userId INT NOT NULL,
    roomId VARCHAR(50) NOT NULL,   
    fullName VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    imageUrl VARCHAR(255) NULL,
    timestamp DATETIME DEFAULT GETDATE() 
);

GO
INSERT INTO UserTBL (username, email, password, fullName, additionalName, dob, gender, phoneNumber, avatarUrl, overview, premiumExpirationDate, premiumAccount, createdAt, updatedAt)
VALUES 
    ('user1', 'user1@example.com', 'pass123', 'Nguyen Van A', 'NVA', '1990-05-15', 1, '0901234567', 'http://example.com/avatar1.jpg', 'Tôi là người vui tính', '2025-12-31 23:59:59', 1, GETDATE(), GETDATE()),
    ('user2', 'user2@example.com', 'pass456', 'Tran Thi B', NULL, '1995-08-20', 0, '0912345678', NULL, 'Yêu thích công nghệ', NULL, 0, GETDATE(), GETDATE()),
    ('user3', 'user3@example.com', 'pass789', 'Le Van C', 'LVC', '1988-11-10', 1, '0923456789', 'http://example.com/avatar3.jpg', NULL, NULL, 0, GETDATE(), GETDATE()),
    ('user4', 'user4@example.com', 'pass101', 'Pham Thi D', NULL, '1992-03-25', 0, '0934567890', NULL, 'Thích du lịch', '2024-06-30 23:59:59', 1, GETDATE(), GETDATE()),
    ('user5', 'user5@example.com', 'pass112', 'Hoang Van E', 'HVE', '1993-07-07', 1, '0945678901', 'http://example.com/avatar5.jpg', 'Người yêu âm nhạc', NULL, 0, GETDATE(), GETDATE());

GO
INSERT INTO FriendTBL (userId1, userId2)
VALUES 
    (1, 2),
    (1, 3),
    (2, 4),
    (3, 4),
    (4, 5);

GO
INSERT INTO Messages (userId, roomId, fullName, content, imageUrl, timestamp)
VALUES 
    (1, 'room_1_2', 'Nguyen Van A', 'Xin chào bạn!', NULL, '2023-10-01 10:00:00'),
    (2, 'room_1_2', 'Tran Thi B', 'Chào bạn, khỏe không?', NULL, '2023-10-01 10:01:00'),
    (1, 'room_1_3', 'Nguyen Van A', 'Hôm nay bạn thế nào?', NULL, '2023-10-02 14:30:00'),
    (3, 'room_1_3', 'Le Van C', 'Tốt, còn bạn?', 'http://example.com/image1.jpg', '2023-10-02 14:32:00'),
    (4, 'room_2_4', 'Pham Thi D', 'Bạn có kế hoạch gì không?', NULL, '2023-10-03 09:15:00'),
    (2, 'room_2_4', 'Tran Thi B', 'Mình định đi du lịch', NULL, '2023-10-03 09:20:00'),
    (5, 'room_4_5', 'Hoang Van E', 'Nghe nhạc không?', 'http://example.com/image2.jpg', '2023-10-04 20:00:00'),
    (4, 'room_4_5', 'Pham Thi D', 'OK, gửi mình bài hay nhé!', NULL, '2023-10-04 20:05:00');

GO
SELECT * FROM UserTBL;
SELECT * FROM FriendTBL;
SELECT * FROM Messages;

SELECT CASE WHEN userId1 = 2 THEN userId2 ELSE userId1 END AS friendId FROM FriendTBL WHERE userId1 = 2 OR userId2 = 2;
SELECT userId, fullName FROM UserTBL WHERE userId = 2

SELECT * FROM Messages WHERE roomId = 'room_1_2' ORDER BY timestamp

INSERT INTO Messages(userId, roomId, fullName, content)  VALUES (1, 'room_1_2', 'Nguyen Van A', 'Thang ngu')