CREATE TABLE IF NOT EXISTS `public_logs` (
    `id` INT AUTO_INCREMENT,
    `ip_address` CHAR(15) NOT NULL,
    `request_method` ENUM('get', 'post', 'put', 'patch', 'delete') NOT NULL,
    `request_endpoint` VARCHAR(50) NOT NULL,
     PRIMARY KEY (`id`)
);