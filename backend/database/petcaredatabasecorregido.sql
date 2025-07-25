-- MySQL Script generated by MySQL Workbench
-- Thu Jul 10 16:38:32 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema petcaredatabase
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `petcaredatabase` ;

-- -----------------------------------------------------
-- Schema petcaredatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petcaredatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `petcaredatabase` ;

-- -----------------------------------------------------
-- Table `petcaredatabase`.`datos_de_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petcaredatabase`.`datos_de_propietario` (
  `DueñoTitular1` VARCHAR(100) NOT NULL,
  `DueñoTitular2` VARCHAR(100) NOT NULL,
  `Dueño_ID` INT NOT NULL,
  `Nacimiento` DATE NULL DEFAULT NULL,
  `Direccion` TEXT NULL DEFAULT NULL,
  `status` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Dueño_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `petcaredatabase`.`datos_de_animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petcaredatabase`.`datos_de_animal` (
  `Nombre` VARCHAR(100) NULL DEFAULT NULL,
  `Animal_ID` INT NOT NULL,
  `Especie` VARCHAR(100) NULL DEFAULT NULL,
  `Genero` VARCHAR(50) NULL DEFAULT NULL,
  `Chip_N` INT NOT NULL,
  `Senas_Particulares` FLOAT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `Fecha_de_Nacimiento` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`Animal_ID`),
  INDEX `fk_datos_de_animal_datos_de_propietario1_idx` (`Animal_ID` ASC) VISIBLE,
  CONSTRAINT `fk_datos_de_animal_datos_de_propietario1`
    FOREIGN KEY (`Animal_ID`)
    REFERENCES `petcaredatabase`.`datos_de_propietario` (`Dueño_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `petcaredatabase`.`motivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petcaredatabase`.`motivo` (
  `Control General` INT NOT NULL,
  `Desparacitaciones` VARCHAR(45) NOT NULL,
  `Intervenciones Quirurgicas` VARCHAR(45) NOT NULL,
  `Test Diagnostico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Control General`, `Desparacitaciones`, `Intervenciones Quirurgicas`, `Test Diagnostico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `petcaredatabase`.`turnos del dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petcaredatabase`.`turnos del dia` (
  `idTurnos 1` INT NOT NULL,
  `idTurnos 2` INT NOT NULL,
  `idTurnos 3` INT NOT NULL,
  `idTurnos 4` INT NOT NULL,
  `idTurnos 5` INT NOT NULL,
  `idTurnos 6` INT NOT NULL,
  `idTurnos 7` INT NOT NULL,
  `idTurnos 8` INT NOT NULL,
  `idTurnos 9` INT NOT NULL,
  `idTurnos 10` INT NOT NULL,
  `idTurno 11` INT NOT NULL,
  `idTurno 12` INT NOT NULL,
  `datos_de_propietario_NombreApellido` VARCHAR(255) NOT NULL,
  `datos_de_propietario_Animal_ID` INT NOT NULL,
  `Motivo_Control General` INT NOT NULL,
  `Motivo_Desparacitaciones` VARCHAR(45) NOT NULL,
  `Motivo_Intervenciones Quirurgicas` VARCHAR(45) NOT NULL,
  `Motivo_Test Diagnostico` VARCHAR(45) NOT NULL,
  `datos_de_animal_Animal_ID` INT NOT NULL,
  PRIMARY KEY (`Motivo_Control General`, `Motivo_Desparacitaciones`, `Motivo_Intervenciones Quirurgicas`, `Motivo_Test Diagnostico`, `datos_de_animal_Animal_ID`),
  INDEX `fk_Turnos del Dia_datos_de_animal1_idx` (`datos_de_animal_Animal_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Turnos del Dia_datos_de_animal1`
    FOREIGN KEY (`datos_de_animal_Animal_ID`)
    REFERENCES `petcaredatabase`.`datos_de_animal` (`Animal_ID`),
  CONSTRAINT `fk_Turnos del Dia_Motivo1`
    FOREIGN KEY (`Motivo_Control General` , `Motivo_Desparacitaciones` , `Motivo_Intervenciones Quirurgicas` , `Motivo_Test Diagnostico`)
    REFERENCES `petcaredatabase`.`motivo` (`Control General` , `Desparacitaciones` , `Intervenciones Quirurgicas` , `Test Diagnostico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
