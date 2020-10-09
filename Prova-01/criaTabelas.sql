-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bdd2_prova_01
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdd2_prova_01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdd2_prova_01` ;
USE `bdd2_prova_01` ;

-- -----------------------------------------------------
-- Table `bdd2_prova_01`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd2_prova_01`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` CHAR(11) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd2_prova_01`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd2_prova_01`.`Vendedor` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` CHAR(11) NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd2_prova_01`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd2_prova_01`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` INT NOT NULL,
  `Vendedor_idVendedor` INT NOT NULL,
  `dataVenda` DATETIME NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `fk_Venda_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Venda_Vendedor1_idx` (`Vendedor_idVendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `bdd2_prova_01`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Vendedor1`
    FOREIGN KEY (`Vendedor_idVendedor`)
    REFERENCES `bdd2_prova_01`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd2_prova_01`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd2_prova_01`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NULL,
  `valorVenda` FLOAT NULL,
  `valorCompra` FLOAT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdd2_prova_01`.`ItensVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdd2_prova_01`.`ItensVenda` (
  `Venda_idVenda` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  INDEX `fk_ItensVenda_Venda1_idx` (`Venda_idVenda` ASC) VISIBLE,
  INDEX `fk_ItensVenda_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_ItensVenda_Venda1`
    FOREIGN KEY (`Venda_idVenda`)
    REFERENCES `bdd2_prova_01`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItensVenda_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `bdd2_prova_01`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
