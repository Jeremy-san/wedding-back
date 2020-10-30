-- MySQL Script generated by MySQL Workbench
-- Sat Sep 19 21:52:17 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wedding
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wedding
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wedding` DEFAULT CHARACTER SET utf8 ;
USE `wedding` ;

-- -----------------------------------------------------
-- Table `wedding`.`addGuest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wedding`.`addGuest` (
  `idAddGuest` INT NOT NULL,
  `inviationGuest` TINYINT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAddGuest`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wedding`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wedding`.`guest` (
  `idGuest` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `invitation` TINYINT NOT NULL,
  `idAddGuest` INT NOT NULL,
  PRIMARY KEY (`idGuest`),
  INDEX `fk_guest_addGuest_idx` (`idAddGuest` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wedding`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wedding`.`admin` (
  `idAdmin` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wedding`.`wedding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wedding`.`wedding` (
  `idWedding` INT NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  `idGuest` INT NOT NULL,
  `idAdmin` INT NOT NULL,
  PRIMARY KEY (`idWedding`, `idAdmin`),
  INDEX `fk_wedding_guest1_idx` (`idGuest` ASC) ,
  INDEX `fk_wedding_admin1_idx` (`idAdmin` ASC) )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;