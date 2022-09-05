CREATE DATABASE IF NOT EXISTS `sql_yts`;

USE `sql_yts`;

DROP TABLE `movies`;

# A director can direct many movies but a movie will have a single director. One To Many

CREATE TABLE IF NOT EXISTS `artists` (
	`id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50),
    `gender` ENUM('male', 'female', 'not-specified') NOT NULL DEFAULT 'not-specified',
    `nationality` VARCHAR(50),
    `known_for` ENUM('actor', 'director', 'actor-director'),
    `date_of_birth` DATE NOT NULL,
    `bio` TEXT,
    `image_link` TEXT NOT NULL,
     PRIMARY KEY (`id`)
);

# A movie can have multiple genres and a genre can be associated with many movies. Many To Many

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
    `backdrop_path` TEXT,
    `trailer_link` TEXT NOT NULL,
    `subtitle_link` TEXT,
    `duration` INT NOT NULL,
    `film_industry` ENUM('hollywood', 'bollywood', 'lollywood', 'tamil-nadu', 'korean') NOT NULL DEFAULT 'hollywood',
    `status` ENUM('upcoming', 'released', 'deleted', 'disabled') NOT NULL DEFAULT 'upcoming',
    `pg_rating` ENUM('PG-8', 'PG-12', 'PG-14', 'PG-16', 'PG-18') NOT NULL,
    `original_language` ENUM('english', 'hindi', 'urdu', 'tamil', 'korean') NOT NULL DEFAULT 'english',
    `budget` DECIMAL(15, 2) NOT NULL,
    `revenue` DECIMAL(15, 2) NOT NULL,
    `director_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (`director_id`) REFERENCES artists(`id`),
     PRIMARY KEY (`id`)
);

# A movie can have multiple torrents. 

CREATE TABLE IF NOT EXISTS `torrents` (
	`id` INT AUTO_INCREMENT,
    `quality` ENUM('480', '720', '1080', '2160', '3840') NOT NULL,
    `path` TEXT NOT NULL,
    `size` BIGINT NOT NULL,
    `seeds` INT,
    `peers` INT,
    `type` ENUM('cam', 'web', 'bluray') NOT NULL,
    `movie_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`movie_id`) REFERENCES movies(`id`),
    PRIMARY KEY (`id`)
)

CREATE TABLE IF NOT EXISTS `movies_genres_mapping` (
    `movie_id` INT NOT NULL,
    `genre_id` INT NOT NULL,
    FOREIGN KEY (`movie_id`) REFERENCES movies(`id`),
    FOREIGN KEY (`genre_id`) REFERENCES genres(`id`),
	PRIMARY KEY (`movie_id`, `genre_id`)
);

CREATE TABLE IF NOT EXISTS `movies_artists_mapping` (
    `id` INT AUTO_INCREMENT,
    `movie_id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    `character_name` VARCHAR(50) NOT NULL,
    `is_leading` BOOLEAN DEFAULT true,
    FOREIGN KEY (`movie_id`) REFERENCES movies(`id`),
    FOREIGN KEY (`artist_id`) REFERENCES artists(`id`),
	PRIMARY KEY (`id`),
    UNIQUE KEY `movie_artist_character_index` (`movie_id`, `artist_id`, `character_name`)
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