Create database TESTTER17;
use TESTTER17;

create table treainee (
trainee_id int auto_increment primary key,
full_name varchar(200),
birth_date date,
gender enum('male', 'female', 'unknown'),
et_iq int(20),
et_gmath int(20),
et_english int(20),
training_class varchar(50),
evaluation_notes text,
check(et_iq < 20 and et_iq >0),
check(et_gmath < 20 and et_gmath > 0 )
);
alter table treainee add column vti_account varchar(20);
alter table treainee drop column vti_account;
SELECT * FROM testter17.treainee;

create table department (
department_id int auto_increment primary key,
department_name varchar(50)
);

create table position (
position_id int auto_increment primary key,
position_name varchar(50)
);

create table `account` (
account_id int auto_increment primary key,
email varchar(20),
username varchar(20),
fullname varchar(20),
department_id int,
position_id int,
create_date date,
foreign key (department_id) references department (department_id),
foreign key (position_id) references position (position_id)
);

create table `group` (
group_id int auto_increment primary key,
group_name varchar(20),
creator_id int,
create_date date
);

create table groupAccount (
group_id int,
account_id int,
join_date date,
foreign key (group_id) references `group` (group_id),
foreign key (account_id) references `account` (account_id)
);

create table typeQuestion (
type_id int auto_increment primary key,
type_name varchar(20)
);

create table categoryQuestion (
category_id int auto_increment primary key,
category_name varchar(20)
);

create table question (
question_id int auto_increment primary key,
content varchar(250),
category_id int,
type_id int,
creator_id int,
create_date date,
foreign key (category_id) references categoryQuestion (category_id),
foreign key (type_id) references typeQuestion (type_id)
);

create table answer (
answer_id int auto_increment primary key,
content varchar(700),
question_id int,
isCorrect boolean,
foreign key (question_id) references question (question_id)
);

create table exam (
exam_id int auto_increment primary key,
code_exam varchar(50),
title varchar(30),
category_id int,
duration time,
creator_id int,
create_date date,
foreign key (category_id) references categoryQuestion (category_id)
);

create table examQuestion (
exam_id int,
question_id int,
foreign key (exam_id) references exam (exam_id),
foreign key (question_id) references question (question_id)
);CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `fullname` varchar(20) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `department_id` (`department_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `answer` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(700) DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `isCorrect` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoryquestion` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exam` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `code_exam` varchar(50) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categoryquestion` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examquestion` (
  `exam_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  KEY `exam_id` (`exam_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `examquestion_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `examquestion_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `groupaccount` (
  `group_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  KEY `group_id` (`group_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `groupaccount_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`),
  CONSTRAINT `groupaccount_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(250) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categoryquestion` (`category_id`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `typequestion` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `treainee` (
  `trainee_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female','unknown') DEFAULT NULL,
  `et_iq` int DEFAULT NULL,
  `et_gmath` int DEFAULT NULL,
  `et_english` int DEFAULT NULL,
  `training_class` varchar(50) DEFAULT NULL,
  `evaluation_notes` text,
  `vti_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`trainee_id`),
  CONSTRAINT `treainee_chk_1` CHECK (((`et_iq` < 20) and (`et_iq` > 0))),
  CONSTRAINT `treainee_chk_2` CHECK (((`et_gmath` < 20) and (`et_gmath` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `typequestion` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
