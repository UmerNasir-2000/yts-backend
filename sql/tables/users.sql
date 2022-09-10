CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50),
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` TEXT NOT NULL,
    `gender` ENUM('male', 'female', 'not-specified') NOT NULL DEFAULT 'not-specified',
    `nationality` VARCHAR(50),
    `type` ENUM('admin', 'user') DEFAULT 'user',
    `status` ENUM('enable', 'disable', 'register') NOT NULL DEFAULT 'register',
     PRIMARY KEY (`id`)
);