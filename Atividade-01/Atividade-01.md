# Atividade 01 - Introdução aos Joins

## _Banco de Dados - II_

### André Rossi Korol – 01810067

```SQL
# 1. Selecione todos os funcionários com seus cargos.
SELECT *
FROM Funcionario
         JOIN Cargo C on C.idCargo = Funcionario.Cargo_idCargo;

# 2. Selecione todos os funcionários com seus departamentos.
SELECT *
FROM Funcionario
         JOIN Departamento D on D.idDepartamento = Funcionario.Departamento_idDepartamento;

# 3. Selecione todos os estados com suas cidades.
SELECT *
FROM Estado
         JOIN Cidade C on Estado.idEstado = C.Estado_idEstado;

# 4. Selecione todos os funcionários com seus cargos e departamentos.
SELECT *
FROM Funcionario
         JOIN Cargo C on C.idCargo = Funcionario.Cargo_idCargo
         JOIN Departamento D on D.idDepartamento = Funcionario.Departamento_idDepartamento;

# 5. Selecione todos os estados com suas cidades e com seus bairros.
SELECT *
FROM Estado
         JOIN Cidade C on Estado.idEstado = C.Estado_idEstado
         INNER JOIN Bairro B on C.idCidade = B.Cidade_idCidade;

# 6. Selecione todos os funcionários com seus bairros, cidades e estados.
SELECT *
FROM Funcionario
         JOIN Bairro B on B.idBairro = Funcionario.Bairro_idBairro
         INNER JOIN Cidade C on B.Cidade_idCidade = C.idCidade
         INNER JOIN Estado E on C.Estado_idEstado = E.idEstado;

# 7. Selecione todos os funcionários com seus bairros, cidades, estados e departamentos.
SELECT *
FROM Funcionario
         JOIN Bairro B on B.idBairro = Funcionario.Bairro_idBairro
         INNER JOIN Cidade C on B.Cidade_idCidade = C.idCidade
         INNER JOIN Estado E on C.Estado_idEstado = E.idEstado
         JOIN Departamento D on Funcionario.Departamento_idDepartamento = D.idDepartamento;

# 8. Selecione todos os funcionários com seus bairros, cidades, estados, departamentos e cargos.
SELECT *
FROM Funcionario
         JOIN Bairro B on B.idBairro = Funcionario.Bairro_idBairro
         INNER JOIN Cidade C on B.Cidade_idCidade = C.idCidade
         INNER JOIN Estado E on C.Estado_idEstado = E.idEstado
         JOIN Departamento D on Funcionario.Departamento_idDepartamento = D.idDepartamento
         JOIN Cargo C2 on Funcionario.Cargo_idCargo = C2.idCargo;
```
