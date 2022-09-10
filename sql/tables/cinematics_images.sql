CREATE TABLE IF NOT EXISTS `cinematics_images` (
    `id` INT AUTO_INCREMENT,
    `image_path` TEXT NOT NULL,
    `cinematic_id` INT NOT NULL,
     FOREIGN KEY (`cinematic_id`) REFERENCES cinematics(`id`),
     PRIMARY KEY (`id`)
);