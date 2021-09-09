CREATE TABLE `users` (
  `id` int AUTO_INCREMENT,
  `usertype` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp,
  PRIMARY KEY (`id`, `usertype`)
);

CREATE TABLE `students` (
  `id` int AUTO_INCREMENT,
  `users_id` int,
  `student_id` varchar(255),
  `full_name` varchar(255),
  `date_of_birth` datetime,
  `contact` varchar(255),
  `gender` varchar(255),
  `address` varchar(255),
  `course_id` int,
  `usertype` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp,
   PRIMARY KEY (`id`, `student_id`)
);

CREATE TABLE `lectures` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `staff_id` varchar(255),
  `users_id` int,
  `full_name` varchar(255),
  `contact` varchar(255),
  `usertype` varchar(255),
  `course_id` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `admin` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `usertype` varchar(255),
  `users_id` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `courses` (
  `id` int AUTO_INCREMENT,
  `code` int,
  `course_name` varchar(255),
  `course_level` varchar(255),
  `users_id` int,
  `created_at` timestamp,
  `updated_at` timestamp,
  `course_start_date` datetime,
  `certificate_issuedate` datetime,
  PRIMARY KEY (`id`, `code`)
);

CREATE TABLE `results` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `module_id` int,
  `student_id` int,
  `grade` varchar(255),
  `marks` int
);

CREATE TABLE `modules` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `module_name` varchar(255),
  `module_code` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `add_module_to_course` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `module_id` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `students` ADD FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

ALTER TABLE `lectures` ADD FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

ALTER TABLE `admin` ADD FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);



ALTER TABLE `students` ADD FOREIGN KEY (`usertype`) REFERENCES `users` (`usertype`);

ALTER TABLE `lectures` ADD FOREIGN KEY (`usertype`) REFERENCES `users` (`usertype`);

ALTER TABLE `admin` ADD FOREIGN KEY (`usertype`) REFERENCES `users` (`usertype`);



ALTER TABLE `lectures` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `courses` ADD FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

ALTER TABLE `results` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `results` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

ALTER TABLE `add_module_to_course` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `add_module_to_course` ADD FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

ALTER TABLE `modules` ADD FOREIGN KEY (`id`) REFERENCES `results` (`module_id`);

