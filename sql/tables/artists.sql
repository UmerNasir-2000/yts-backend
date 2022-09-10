CREATE TABLE IF NOT EXISTS `artists` (
	`id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50),
    `gender` ENUM('male', 'female', 'not-specified') NOT NULL DEFAULT 'not-specified',
    `nationality` VARCHAR(50),
    `known_for` ENUM('actor', 'director', 'actor-director') DEFAULT 'actor',
    `birth_year` YEAR(4) NOT NULL,
    `bio` TEXT,
    `image_link` TEXT NOT NULL,
     PRIMARY KEY (`id`)
);