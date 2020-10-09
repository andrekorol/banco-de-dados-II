INSERT INTO Cliente (nome, cpf)
VALUES ("Srta. Isabel Albuquerque", "05962781368"),
       ("Dr. Breno Reis", "69548217309"),
       ("Marli Nogueira", "42786193591"),
       ("Fabrício Pereira", "50976138484"),
       ("Nataniel Albuquerque Filho", "05968247185");

INSERT INTO Vendedor (nome, cpf)
VALUES ("Guilherme Franco", "14075863948"),
       ("Morgana Saraiva", "69584302124"),
       ("Hugo Oliveira", "53946780229"),
       ("Suélen Moraes", "90285764101"),
       ("Vitória Pereira", "38679405256");

INSERT INTO Produto (nomeProduto, valorVenda, valorCompra)
VALUES ("Placa de Vídeo", 2099, 2000),
       ("Processador", 659, 600),
       ("SSD", 349, 300),
       ("Memoria RAM", 276.90, 200),
       ("Mouse", 229.90, 200);

CREATE PROCEDURE insere_vendas()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE id_venda INT DEFAULT 1;
    DECLARE num_vendedores INT UNSIGNED DEFAULT (SELECT COUNT(*) FROM Vendedor);
    DECLARE num_produtos INT UNSIGNED DEFAULT (SELECT COUNT(*) FROM Produto);
    DECLARE data_venda INT UNSIGNED DEFAULT UNIX_TIMESTAMP("2020-04-16 12:00:00");
    DECLARE um_dia INT DEFAULT 86400; # em segundos
    loop_vendedores:
    LOOP
        loop_produtos:
        LOOP
            INSERT INTO Venda (Cliente_idCliente, Vendedor_idVendedor, dataVenda)
            VALUES (i, i, FROM_UNIXTIME(data_venda));
            INSERT INTO ItensVenda (Venda_idVenda, Produto_idProduto) VALUES (id_venda, i);
            SET i = i + 1;
            SET id_venda = id_venda + 1;
            SET data_venda = data_venda + um_dia;
            IF i > num_produtos THEN
                SET i = 1;
                LEAVE loop_produtos;
            END IF;
        END LOOP loop_produtos;
        SET j = j + 1;
        IF j > num_vendedores THEN
            LEAVE loop_vendedores;
        END IF;
    END LOOP loop_vendedores;
END;

CALL insere_vendas();
