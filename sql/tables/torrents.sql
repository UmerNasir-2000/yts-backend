CREATE TABLE IF NOT EXISTS `torrents` (
	`id` INT AUTO_INCREMENT,
    `quality` ENUM('480', '720', '1080', '2160', '3840') NOT NULL,
    `path` TEXT NOT NULL,
    `size` BIGINT,
    `seeds` INT,
    `peers` INT,
    `type` ENUM('cam', 'web', 'bluray') NOT NULL,
    `cinematic_id` INT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     PRIMARY KEY (`id`)
);