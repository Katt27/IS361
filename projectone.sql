/* 
Tech Innovators Academy Database
Description: This database is designed to manage and track student enrollments in cutting-edge technology courses offered by Tech Innovators Academy. It helps administrators efficiently oversee course offerings, student progress, and align resources with industry trends and student interests.
*/

-- Ensure idempotency by dropping tables if they exist
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Duration INT, -- Duration in weeks
    UNIQUE (CourseName)
);

-- Create Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    YearOfStudy INT
);

-- Create Enrollments table to represent the many-to-many relationship between Students and Courses
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert sample data into Courses
INSERT INTO Courses (CourseName, Duration) VALUES
('Artificial Intelligence', 12),
('Blockchain Fundamentals', 8),
('Cybersecurity Essentials', 10),
('Full Stack Web Development', 14);

-- Insert sample data into Students
INSERT INTO Students (StudentName, Email, YearOfStudy) VALUES
('Alice Smith', 'alice@example.com', 2),
('Bob Johnson', 'bob@example.com', 1),
('Charlie Davis', 'charlie@example.com', 3),
('Dana Lee', 'dana@example.com', 2);

-- Insert sample data into Enrollments
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(3, 3),
(4, 4);

-- Query to show which students are taking which courses
SELECT
    s.StudentName,
    c.CourseName
FROM
    Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY
    s.StudentName, c.CourseName;
