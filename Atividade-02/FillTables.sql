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
