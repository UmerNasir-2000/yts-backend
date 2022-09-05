# YTS CLONE SCRIPT
# AUTHOR = M. Umer Nasir, M. Ahmed Khatri
# DATE = 5th Sept, 2022

DROP DATABASE IF EXISTS `sql_yts`;
CREATE DATABASE IF NOT EXISTS `sql_yts`;

USE `sql_yts`;

-- TABLE CREATION SECTION

DROP TABLE IF EXISTS `cinematics`;
DROP TABLE IF EXISTS `artists`;
DROP TABLE IF EXISTS `genres`;
DROP TABLE IF EXISTS `torrents`;
DROP TABLE IF EXISTS `cinematics_genres_mapping`;
DROP TABLE IF EXISTS `cinematics_artists_mapping`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `users_favourites`;
DROP TABLE IF EXISTS `requests`;
DROP TABLE IF EXISTS `public_logs`;
DROP TABLE IF EXISTS `download_details`;
DROP TABLE IF EXISTS `cinematics_images`;

# A director can direct many movies but a movie will have a single director. One To Many

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

# A movie can have multiple genres and a genre can be associated with many movies. Many To Many

CREATE TABLE IF NOT EXISTS `genres` (
	`id` INT AUTO_INCREMENT,
    `name` ENUM('action', 'crime', 'adventure', 'fantasy', 'sci-fi', 'thriller', 'horror', 'romantic', 'drama', 'animation') NOT NULL,
	 PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `cinematics` (
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
    `type` ENUM('movie', 'season') NOT NULL DEFAULT 'movie',
    `status` ENUM('upcoming', 'released', 'deleted', 'disabled') NOT NULL DEFAULT 'upcoming',
    `pg_rating` ENUM('PG-8', 'PG-12', 'PG-14', 'PG-16', 'PG-18') NOT NULL,
    `original_language` ENUM('english', 'hindi', 'urdu', 'tamil', 'korean') NOT NULL DEFAULT 'english',
    `budget` DECIMAL(15, 2) NOT NULL,
    `revenue` DECIMAL(15, 2) NOT NULL,
    `director_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (`director_id`) REFERENCES artists(`id`),
     PRIMARY KEY (`id`),
     UNIQUE KEY `title_year_index` (`title`, `released_year`)
);

CREATE TABLE IF NOT EXISTS `cinematics_images` (
    `id` INT AUTO_INCREMENT,
    `image_path` TEXT NOT NULL,
    `cinematic_id` INT NOT NULL,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`),
     PRIMARY KEY (`id`),
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
    `cinematic_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `cinematics_genres_mapping` (
    `cinematic_id` INT NOT NULL,
    `genre_id` INT NOT NULL,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     FOREIGN KEY (`genre_id`) REFERENCES genres(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
	 PRIMARY KEY (`cinematic_id`, `genre_id`)
);

CREATE TABLE IF NOT EXISTS `cinematics_artists_mapping` (
    `id` INT AUTO_INCREMENT,
    `character_name` VARCHAR(50) NOT NULL,
    `is_leading` BOOLEAN DEFAULT true,
    `cinematic_id` INT NOT NULL,
    `artist_id` INT NOT NULL,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     FOREIGN KEY (`artist_id`) REFERENCES artists(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
	 PRIMARY KEY (`id`),
     UNIQUE KEY `cinematic_artist_character_index` (`cinematic_id`, `artist_id`, `character_name`)
);

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50),
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` TEXT NOT NULL,
    `gender` ENUM('male', 'female', 'not-specified') NOT NULL DEFAULT 'not-specified',
    `nationality` VARCHAR(50),
    `type` ENUM('admin', 'user') DEFAULT `user`,
    `status` ENUM('enable', 'disable', 'register') NOT NULL DEFAULT 'register',
     PRIMARY KEY (`id`)
);

# A User Can Favourite Only Coming Soon Movies.

CREATE TABLE IF NOT EXISTS `users_favourites` (
    `id` INT AUTO_INCREMENT,
    `is_notified` BOOLEAN default false,
    `user_id` INT NOT NULL,
     FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     PRIMARY KEY (`id`)
);

# A USER CAN MAKE MULTIPLE REQUESTS

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

CREATE TABLE IF NOT EXISTS `public_logs` (
    `id` INT AUTO_INCREMENT,
    `ip_address` CHAR(15) NOT NULL,
    `request_method` ENUM('get', 'post', 'put', 'patch', 'delete') NOT NULL,
    `request_endpoint` VARCHAR(50) NOT NULL,
     PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `download_details` (
    `id` INT AUTO_INCREMENT,
    `torrent_id` INT NOT NULL,    
    `cinematic_id` INT NOT NULL,
    `user_id` INT,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     FOREIGN KEY (`torrent_id`) REFERENCES torrents(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     PRIMARY KEY (`id`)
);

-- INSERT GENRES

INSERT INTO `genres`(`name`) VALUES ('action'), ('crime'), ('sci-fi'),
                                    ('adventure'), ('horror'), ('romantic'),
                                    ('drama'), ('animation'), ('thriller'),
                                    ('fantasy');

-- INSERT ARTISTS


INSERT INTO `artists`(`first_name`, `last_name`, `birth_year`, `image_link`) VALUES
            ('John', 'Cena', 1977, 'john_cena.jpg'), ('Tom', 'Cruise', 1962, 'tom_cruise.jpg'),
            ('Chris', 'Evans', 1981, 'chris_evans.jpg'), ('Margott', 'Robbie', 1990, 'margott_robbie.jpg'),
            ('Chris', 'Hemsworth', 1983, 'chris_hemsworth.jpg'), ('Elizabeth', 'Olsen', 1989, 'elizabeth_olsen.jpg');