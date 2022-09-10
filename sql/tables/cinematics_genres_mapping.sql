CREATE TABLE IF NOT EXISTS `cinematics_genres_mapping` (
    `cinematic_id` INT NOT NULL,
    `genre_id` INT NOT NULL,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     FOREIGN KEY (`genre_id`) REFERENCES genres(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
	 PRIMARY KEY (`cinematic_id`, `genre_id`)
);