-- MySQL Workbench Synchronization
-- Generated: 2020-08-24 19:10
-- Model: New Model
-- Version: 1.0
-- Project: Banco de Dados II - Atividade 02
-- Author: Andre Rossi Korol

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `bdd2_atividade_02`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `bdd2_atividade_02`.`Cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `cpf` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdd2_atividade_02`.`Vendedor` (
  `idVendedor` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `cpf` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdd2_atividade_02`.`Venda` (
  `Vendedor_idVendedor` INT(10) UNSIGNED NOT NULL,
  `Cliente_idCliente` INT(11) NOT NULL,
  `Produto_idProduto` INT(10) UNSIGNED NOT NULL,
  INDEX `fk_Venda_Vendedor_idx` (`Vendedor_idVendedor` ASC) VISIBLE,
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Venda_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Vendedor`
    FOREIGN KEY (`Vendedor_idVendedor`)
    REFERENCES `bdd2_atividade_02`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `bdd2_atividade_02`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `bdd2_atividade_02`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `bdd2_atividade_02`.`Produto` (
  `idProduto` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NULL DEFAULT NULL,
  `valor` FLOAT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
