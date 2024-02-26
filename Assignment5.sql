-- Video_Reviews Database Creation and Population Script
-- Assignment for the course on Database Management
-- Author: [Your Name Here]
-- Group Members: [Member 1 Name], [Member 2 Name], [Member 3 Name]
-- This script is designed to demonstrate the creation and manipulation of a database
-- containing "how-to" videos on Power BI, including user reviews.

-- Start by creating the Video_Reviews database.
CREATE DATABASE IF NOT EXISTS Video_Reviews;
USE Video_Reviews;

-- Create a table 'videos' to store video details.
CREATE TABLE IF NOT EXISTS videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    length_minutes INT NOT NULL,
    url VARCHAR(255) NOT NULL
);

-- Populate the 'videos' table with sample data.
INSERT INTO videos (title, length_minutes, url) VALUES
('Getting Started with Power BI', 30, 'https://www.example.com/video1'),
('Power BI for Beginners', 45, 'https://www.example.com/video2'),
('Advanced Data Visualization with Power BI', 60, 'https://www.example.com/video3');

-- Create a table 'user_reviews' for storing user reviews of the videos.
CREATE TABLE IF NOT EXISTS user_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    rating INT NULL CHECK (rating BETWEEN 0 AND 5),
    review_text VARCHAR(255) NOT NULL,
    video_id INT,
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

-- Insert sample reviews for the videos.
INSERT INTO user_reviews (user_name, rating, review_text, video_id) VALUES
('Luis', 5, 'Loved it! The best intro to Power BI.', 1),
('Sonya', 4, 'Very informative, but could use more examples.', 1),
('Raj', 3, 'Good overview, but a bit too fast-paced.', 2),
('Maria', 5, 'Excellent! Clear and to the point.', 2);

-- SQL JOIN to show videos and their corresponding user reviews.
SELECT v.title, v.length_minutes, v.url, ur.user_name, ur.rating, ur.review_text
FROM videos v
JOIN user_reviews ur ON v.video_id = ur.video_id;

-- End of script
