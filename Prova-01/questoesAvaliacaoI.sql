# Exercicio 1
# a.
SELECT dataVenda, nomeProduto, V.nome as nomeVendedor, C.nome as nomeCliente
FROM Venda
         JOIN ItensVenda IV on Venda.idVenda = IV.Venda_idVenda
         JOIN Produto P on P.idProduto = IV.Produto_idProduto
         JOIN Vendedor V on V.idVendedor = Venda.Vendedor_idVendedor
         JOIN Cliente C on C.idCliente = Venda.Cliente_idCliente
ORDER BY nomeVendedor;

# b.
SELECT dataVenda, nomeProduto, V.nome as nomeVendedor, C.nome as nomeCliente
FROM Venda
         JOIN ItensVenda IV on Venda.idVenda = IV.Venda_idVenda
         JOIN Produto P on P.idProduto = IV.Produto_idProduto
         JOIN Vendedor V on V.idVendedor = Venda.Vendedor_idVendedor
         LEFT JOIN Cliente C on C.idCliente = Venda.Cliente_idCliente
ORDER BY nomeVendedor;

# Exercicio 2
SELECT nome, SUM(valorVenda) as valorTotalCompras
FROM Cliente
         JOIN Venda V on Cliente.idCliente = V.Cliente_idCliente
         JOIN ItensVenda IV on V.idVenda = IV.Venda_idVenda
         JOIN Produto P on P.idProduto = IV.Produto_idProduto
GROUP BY Cliente_idCliente;

# Exercicio 3
CREATE VIEW TotalVendasVendedor as
SELECT nome, SUM(valorVenda) as valorTotalVendido
FROM Vendedor
         JOIN Venda V on Vendedor.idVendedor = V.Vendedor_idVendedor
         JOIN ItensVenda IV on V.idVenda = IV.Venda_idVenda
         JOIN Produto P on IV.Produto_idProduto = P.idProduto
GROUP BY Vendedor_idVendedor;

# Exercicio 4
DROP PROCEDURE IF EXISTS CadastraNovoProduto;
CREATE PROCEDURE CadastraNovoProduto(nomeProduto VARCHAR(45), valorVenda FLOAT, valorCompra FLOAT)
root:
BEGIN
    IF (LENGTH(nomeProduto) = 0) THEN
        SELECT "O campo nomeProduto é obrigatorio" as msg;
        LEAVE root;
    END IF;

    IF (valorVenda <= 0) THEN
        SELECT "Campo valorVenda inválido. Por favor use um número > 0" as msg;
        LEAVE root;
    END IF;

    IF (valorCompra <= 0) THEN
        SELECT "Campo valorCompra inválido. Por favor use um número > 0" as msg;
        LEAVE root;
    END IF;

    INSERT INTO Produto (nomeProduto, valorVenda, valorCompra) VALUES (nomeProduto, valorVenda, valorCompra);
    SELECT "Produto cadastrado com sucesso" as msg;
END;

# Exercicio 5
CREATE TABLE IF NOT EXISTS Historico
(
    `idHistorico`           INT         NOT NULL AUTO_INCREMENT,
    `momentoModificacao`    DATETIME    NOT NULL,
    `idProduto`             INT         NOT NULL,
    `nomeProdutoModificado` VARCHAR(45) NOT NULL,
    `valorVendaModificado`  FLOAT       NOT NULL,
    `valorCompraModificado` FLOAT       NOT NULL,
    PRIMARY KEY (`idHistorico`)
);

DROP TRIGGER IF EXISTS Depois_Alterar_Produto;
CREATE TRIGGER Depois_Alterar_Produto
    AFTER UPDATE
    on Produto
    FOR EACH ROW
BEGIN
    INSERT INTO Historico (momentoModificacao, idProduto, nomeProdutoModificado, valorVendaModificado,
                           valorCompraModificado)
    VALUES (NOW(), OLD.idProduto, OLD.nomeProduto, OLD.valorVenda, OLD.valorCompra);
END;
