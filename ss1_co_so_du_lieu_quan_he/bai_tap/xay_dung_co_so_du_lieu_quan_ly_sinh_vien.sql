CREATE SCHEMA `student_management`;
CREATE TABLE `student_management`.`student`(
id INT NOT NULL primary key,
`name` VARCHAR(45) NULL,
age INT NULL,
country VARCHAR(45) NULL
);
CREATE TABLE `student_management`.`class`(
id INT NOT NULL primary key,
`name` VARCHAR(45) NULL
);
CREATE TABLE `student_management`.`teacher`(
id INT NOT NULL primary key,
`name` VARCHAR(45) NULL,
age INT NULL,
country VARCHAR(45) NULL
);
