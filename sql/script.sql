CREATE DATABASE IF NOT EXISTS `sql_yts`;

USE `sql_yts`;

DROP TABLE `movies`;

# A director can direct many movies but a movie will have a single director. One To Many

CREATE TABLE IF NOT EXISTS `directors` (
	`id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50),
    `date_of_birth` DATE NOT NULL,
    `bio` TEXT,
    `image_link` TEXT NOT NULL,
     PRIMARY KEY (`id`)
);

# A movie can have multiple genres. One To Many

CREATE TABLE IF NOT EXISTS `genres` (
	`id` INT AUTO_INCREMENT,
    `name` ENUM('action', 'crime', 'adventure', 'fantasy', 'sci-fi', 'thriller', 'horror', 'romantic', 'drama') NOT NULL,
	 PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `movies` (
	`id` INT AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `synopsis` TEXT NOT NULL,
    `tagline` VARCHAR(255) NOT NULL,
    `released_year` YEAR(4) NOT NULL,
    `poster_path` TEXT NOT NULL,
    `trailer_link` TEXT NOT NULL,
    `duration` INT NOT NULL,
    `film_industry` ENUM('hollywood', 'bollywood', 'lollywood', 'tamil-nadu', 'korean') NOT NULL DEFAULT 'hollywood',
    `status` ENUM('upcoming', 'released', 'deleted', 'disabled') NOT NULL DEFAULT 'upcoming',
    `pg_rating` ENUM('PG-8', 'PG-12', 'PG-14', 'PG-16', 'PG-18') NOT NULL,
    `original_language` ENUM('english', 'hindi', 'urdu', 'tamil', 'korean') NOT NULL DEFAULT 'english',
    `budget` DECIMAL(15, 2) NOT NULL,
    `revenue` DECIMAL(15, 2) NOT NULL,
    `director_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (`director_id`) REFERENCES directors(`id`),
     PRIMARY KEY (`id`)
);

INSERT INTO `movies` (title, synopsis, tagline, released_year, poster_path, duration, pg_rating, budget, revenue) 
VALUES ("Zack Snyder's Justice League", 
"Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to 
recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions.",
'Unite the Seven.',
'2021',
'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg',
242,
'PG-18',
70000000.00,
657900000.00
);


SELECT * FROM movies;