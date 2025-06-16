CREATE DATABASE internship_db;

USE internship_db;

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    resume_path VARCHAR(255)
);

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    description TEXT
);

CREATE TABLE internships (
    internship_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    title VARCHAR(100),
    location VARCHAR(100),
    type ENUM('remote', 'on-site'),
    skills_required TEXT,
    salary VARCHAR(50),
    duration VARCHAR(50),
    deadline DATE,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    internship_id INT,
    student_id INT,
    status ENUM('applied', 'shortlisted', 'accepted', 'rejected'),
    applied_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (internship_id) REFERENCES internships(internship_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
