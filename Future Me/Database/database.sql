CREATE TABLE USERS
(
ID int IDENTITY(1,1) PRIMARY KEY,
Email varchar(255) NOT NULL,
Password varchar(255) NOT NULL
)

CREATE TABLE MAIL
(
ID int IDENTITY(1,1) PRIMARY KEY,
IDUser int NOT NULL,
EmailTo varchar(255) NOT NULL,
Subject varchar(255) NOT NULL,
Letter TEXT NOT NULL,
DeliverOn DATETIME NOT NULL,
Status int NOT NULL,
FOREIGN KEY (IDUser) REFERENCES USERS(ID)
);

SET IDENTITY_INSERT USERS ON
INSERT INTO USERS (ID,Email,Password)
VALUES (1,'anonymous','anonymous');

SET IDENTITY_INSERT MAIL ON
INSERT INTO MAIL (ID, IDUser, EmailTo, Subject, Letter, DeliverOn)
VALUES (1,1,'example@test.com', 'Test', 'Test', '1/1/2015');