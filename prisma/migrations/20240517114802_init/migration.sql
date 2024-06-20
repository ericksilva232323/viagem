-- CreateTable
CREATE TABLE `Destinos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `valor` VARCHAR(50) NOT NULL,
    `data` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PontosTuristicos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_destinos` INTEGER NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `endereco` VARCHAR(50) NOT NULL,
    `telefone` VARCHAR(20) NOT NULL,
    `valor` VARCHAR(50) NOT NULL,

    UNIQUE INDEX `PontosTuristicos_telefone_key`(`telefone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Hoteis` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_destinos` INTEGER NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `valor` VARCHAR(50) NOT NULL,
    `avaliacao` INTEGER NOT NULL,
    `email` VARCHAR(255) NULL,
    `site` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `PontosTuristicos` ADD CONSTRAINT `PontosTuristicos_id_destinos_fkey` FOREIGN KEY (`id_destinos`) REFERENCES `Destinos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Hoteis` ADD CONSTRAINT `Hoteis_id_destinos_fkey` FOREIGN KEY (`id_destinos`) REFERENCES `Destinos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
