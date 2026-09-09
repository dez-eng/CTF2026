CREATE DATABASE IF NOT EXISTS ctf_db;
USE ctf_db;

CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO teams (name) VALUES
('Barcelona'),
('Atletico Madrid'),
('Liverpool');

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password) VALUES
('admin', '482c811da5d5b4bc6d497ffa98491e38');
