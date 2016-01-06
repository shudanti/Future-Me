CREATE TABLE USERS
(
ID int IDENTITY(1,1) PRIMARY KEY,
Email varchar(255) NOT NULL UNIQUE,
Password varchar(255) NOT NULL
)

CREATE TABLE MAIL
(
ID int IDENTITY(1,1) PRIMARY KEY,
IDUser int NOT NULL,
EmailTo varchar(255) NOT NULL,
Subject nvarchar(255) NOT NULL,
Letter NTEXT NOT NULL,
DeliverOn DATETIME NOT NULL,
Status int NOT NULL,
ViewStatus int NOT NULL,
FOREIGN KEY (IDUser) REFERENCES USERS(ID)
);

INSERT INTO USERS (Email,Password)
VALUES ('anonymous@anonymous.com','anonymous');
