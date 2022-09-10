CREATE TABLE IF NOT EXISTS `users_favourites` (
    `id` INT AUTO_INCREMENT,
    `is_notified` BOOLEAN default false,
    `user_id` INT NOT NULL,
     FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON UPDATE CASCADE ON DELETE NO ACTION,
     PRIMARY KEY (`id`)
);