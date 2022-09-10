CREATE TABLE IF NOT EXISTS `requests` (
    `id` INT AUTO_INCREMENT,
    `cinematic_title` VARCHAR(255) NOT NULL,
    `cinematic_description` TEXT,
    `status` ENUM('initiate', 'in-process', 'fulfill') DEFAULT 'initiate',
    `user_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     PRIMARY KEY (`id`)
);