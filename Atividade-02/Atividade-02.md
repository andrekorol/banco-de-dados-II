# Atividade 02 - Left Join

## _Banco de Dados - II_

### André Rossi Korol – 01810067

```SQL
# Preencha as tabelas com 5 clientes, 5 vendedores e 5 produtos.
INSERT INTO Cliente (nome, cpf)
VALUES ("Srta. Isabel Albuquerque", "059.627.813-68"),
       ("Dr. Breno Reis", "695.482.173-09"),
       ("Marli Nogueira", "427.861.935-91"),
       ("Fabrício Pereira", "509.761.384-84"),
       ("Nataniel Albuquerque Filho", "059.682.471-85");

INSERT INTO Vendedor (nome, cpf)
VALUES ("Guilherme Franco", "140.758.639-48"),
       ("Morgana Saraiva", "695.843.021-24"),
       ("Hugo Oliveira", "539.467.802-29"),
       ("Suélen Moraes", "902.857.641-01"),
       ("Vitória Pereira", "386.794.052-56");

INSERT INTO Produto (nomeProduto, valor)
VALUES ("Placa de Vídeo", 2099),
       ("Processador", 659),
       ("SSD", 349),
       ("Memoria RAM", 276.90),
       ("Mouse", 229.90);

# Preencha a tabela vendas da seguinte forma:
CREATE PROCEDURE insere_vendas(num_vendas INT, id_vendedor INT, id_produto INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    loop_simples:
    LOOP
        INSERT INTO Venda (Vendedor_idVendedor, Cliente_idCliente, Produto_idProduto)
        VALUES (id_vendedor, i, id_produto);
        SET i = i + 1;
        IF i > num_vendas THEN
            LEAVE loop_simples;
        END IF;
    END LOOP loop_simples;
END;

# 1. Faça cinco vendas para o vendedor 1 do produto 3 e do produto 2.
CALL insere_vendas(5, 1, 3);
CALL insere_vendas(5, 1, 2);

# 2. Faça duas vendas para o vendedor 2 do produto 1.
CALL insere_vendas(2, 2, 1);
```

#### INSTRUÇÕES SQL:

```SQL
# 1. Apresente todas as vendas com seus respectivos produtos, vendedores e compradores.
SELECT *
FROM Venda
         JOIN Produto P on P.idProduto = Venda.Produto_idProduto
         JOIN Vendedor V on V.idVendedor = Venda.Vendedor_idVendedor
         JOIN Cliente C on C.idCliente = Venda.Cliente_idCliente;

# 2. Apresente todos os vendedores e todas as suas vendas.
SELECT *
FROM Vendedor
         JOIN Venda V on Vendedor.idVendedor = V.Vendedor_idVendedor;

# 3. Apresente todos os vendedores mesmo que eles não possuam vendas.
SELECT *
FROM Vendedor
         LEFT JOIN Venda V on Vendedor.idVendedor = V.Vendedor_idVendedor;

# 4. Apresente todos os produtos e todas as vendas.
SELECT *
FROM Produto
         JOIN Venda V on Produto.idProduto = V.Produto_idProduto;

# 5. Apresente todos os produtos mesmo os que não possuam vendas associadas.
SELECT *
FROM Produto
         LEFT JOIN Venda V on Produto.idProduto = V.Produto_idProduto;

# 6 Apresente todos os clientes e todas as suas vendas.
SELECT *
FROM Cliente
         JOIN Venda V on Cliente.idCliente = V.Cliente_idCliente;

# 7. Apresente todos os clientes mesmo que não existam vendas associadas a ele.
SELECT *
FROM Cliente
         LEFT JOIN Venda V on Cliente.idCliente = V.Cliente_idCliente;
```
