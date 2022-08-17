-- MySQL Script generated by MySQL Workbench
-- Mon Jul  4 11:26:18 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TipoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoCliente` (
  `idTipo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` DECIMAL(9) NOT NULL,
  `fkTipoCliente` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fkTipoCliente_idx` (`fkTipoCliente` ASC),
  CONSTRAINT `fkTipoCliente`
    FOREIGN KEY (`fkTipoCliente`)
    REFERENCES `mydb`.`TipoCliente` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `curso` VARCHAR(45) NOT NULL,
  `periodo` VARCHAR(45) NOT NULL,
  `professor` VARCHAR(45) NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idAluno`),
  INDEX `fkCliente_idx` (`fkCliente` ASC),
  CONSTRAINT `fkCliente`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `valor` FLOAT NOT NULL,
  `pago` TINYINT NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `fkCliente_idx` (`fkCliente` ASC),
  CONSTRAINT `fkCliente`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idProdutos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItensVendidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItensVendidos` (
  `idItensVendidos` INT NOT NULL AUTO_INCREMENT,
  `quantidade` DECIMAL(4) NOT NULL,
  `valorVenda` FLOAT NOT NULL,
  `fkProdutos` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  PRIMARY KEY (`idItensVendidos`),
  INDEX `fkProdutos_idx` (`fkProdutos` ASC),
  INDEX `fkVenda_idx` (`fkVenda` ASC),
  CONSTRAINT `fkProdutos`
    FOREIGN KEY (`fkProdutos`)
    REFERENCES `mydb`.`Produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkVenda`
    FOREIGN KEY (`fkVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
