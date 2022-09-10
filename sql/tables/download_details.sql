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