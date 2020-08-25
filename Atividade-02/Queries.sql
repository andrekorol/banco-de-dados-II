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
