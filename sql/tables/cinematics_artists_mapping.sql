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