CREATE SCHEMA `hb_05_many_to_many`;

set schema `hb_05_many_to_many`;

CREATE TABLE `student`
(
    `id`         bigint AUTO_INCREMENT PRIMARY KEY,
    `first_name` varchar(45) DEFAULT NULL,
    `last_name`  varchar(45) DEFAULT NULL,
    `email`      varchar(45) DEFAULT NULL
);

CREATE TABLE `instructor_detail`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `youtube_channel` varchar(128) DEFAULT NULL,
    `hobby`           varchar(45)  DEFAULT NULL,
);

CREATE TABLE `instructor`
(
    `id`                   int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name`           varchar(45) DEFAULT NULL,
    `last_name`            varchar(45) DEFAULT NULL,
    `email`                varchar(45) DEFAULT NULL,
    `instructor_detail_id` int(11)     DEFAULT NULL,
    CONSTRAINT `FK_DETAIL` FOREIGN KEY (`instructor_detail_id`) REFERENCES `instructor_detail` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `course`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title`         varchar(128) DEFAULT NULL UNIQUE,
    `instructor_id` int(11)      DEFAULT NULL,
    CONSTRAINT `FK_INSTRUCTOR` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `review`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `comment`   varchar(256) DEFAULT NULL,
    `course_id` int(11)      DEFAULT NULL,
    CONSTRAINT `FK_COURSE` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `course_student`
(
    `course_id`  int(11) NOT NULL PRIMARY KEY ,
    `student_id` int(11) NOT NULL PRIMARY KEY ,

    CONSTRAINT `FK_COURSE_05` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT `FK_STUDENT` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


