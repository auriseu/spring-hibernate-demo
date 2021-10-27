create user if not exists hbstudent password 'hbstudent' admin;
GRANT ALTER ANY SCHEMA TO hbstudent;

create schema hb_student_tracker;

set schema hb_student_tracker;

CREATE TABLE `student`
(
    `id`         bigint AUTO_INCREMENT PRIMARY KEY,
    `first_name` varchar(45) DEFAULT NULL,
    `last_name`  varchar(45) DEFAULT NULL,
    `email`      varchar(45) DEFAULT NULL
)