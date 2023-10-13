CREATE DATABASE craiglist;

USE craiglist;

CREATE TABLE Regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    preferred_region_id INT,
    FOREIGN KEY (preferred_region_id) REFERENCES Regions(region_id)
);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    text TEXT,
    user_id INT,
    location VARCHAR(255) NOT NULL,
    region_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE PostCategories (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
