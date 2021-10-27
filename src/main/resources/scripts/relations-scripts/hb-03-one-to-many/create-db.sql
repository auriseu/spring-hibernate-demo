CREATE SCHEMA `hb_03_one_to_many`;

set schema `hb_03_one_to_many`;

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
