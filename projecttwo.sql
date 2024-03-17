-- Ensure the environment is clean by dropping tables if they exist
DROP TABLE IF EXISTS UserGroup;
DROP TABLE IF EXISTS GroupRoomAccess;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Rooms;

-- Create tables
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255),
    GroupID INT
);

CREATE TABLE Groups (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(255)
);

CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(255)
);

CREATE TABLE GroupRoomAccess (
    GroupID INT,
    RoomID INT,
    PRIMARY KEY (GroupID, RoomID),
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

-- Populate Groups
INSERT INTO Groups VALUES
(1, 'I.T.'),
(2, 'Sales'),
(3, 'Administration'),
(4, 'Operations');

-- Populate Users
INSERT INTO Users VALUES
(1, 'Modesto', 1),
(2, 'Ayine', 1),
(3, 'Christopher', 2),
(4, 'Cheong woo', 2),
(5, 'Saulat', 3),
(6, 'Heidy', NULL); -- NULL for Heidy who has not been assigned to a group

-- Populate Rooms
INSERT INTO Rooms VALUES
(1, '101'),
(2, '102'),
(3, 'Auditorium A'),
(4, 'Auditorium B');

-- Populate GroupRoomAccess
INSERT INTO GroupRoomAccess VALUES
(1, 1), -- I.T. -> 101
(1, 2), -- I.T. -> 102
(2, 2), -- Sales -> 102
(2, 3); -- Sales -> Auditorium A
