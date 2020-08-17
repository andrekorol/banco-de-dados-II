DROP TABLE IF EXISTS Cargo;
CREATE TABLE Cargo
(
    idCargo     INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeCargo   VARCHAR(45),
    SalarioBase FLOAT
);

DROP TABLE IF EXISTS Funcionario;
CREATE TABLE Funcionario
(
    idFuncionario               INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome                        VARCHAR(100),
    rg                          VARCHAR(20),
    cpf                         VARCHAR(14),
    telefone                    VARCHAR(20),
    endereco                    VARCHAR(128),
    Cargo_idCargo               INT,
    Departamento_idDepartamento INT,
    Bairro_idBairro             INT,
    salario                     FLOAT
);

DROP TABLE IF EXISTS Departamento;
CREATE TABLE Departamento
(
    idDepartamento   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeDepartamento VARCHAR(45)
);

DROP TABLE IF EXISTS Bairro;
CREATE TABLE Bairro
(
    idBairro        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeBairro      VARCHAR(45),
    Cidade_idCidade INT
);

DROP TABLE IF EXISTS Cidade;
CREATE TABLE Cidade
(
    idCidade        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeCidade      VARCHAR(45),
    Estado_idEstado INT
);

DROP TABLE IF EXISTS Estado;
CREATE TABLE Estado
(
    idEstado   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEstado VARCHAR(45)
);

ALTER TABLE Funcionario
    ADD CONSTRAINT fk_Cargo
        FOREIGN KEY (Cargo_idCargo)
            REFERENCES Cargo (idCargo),

    ADD CONSTRAINT fk_Departamento
        FOREIGN KEY (Departamento_idDepartamento)
            REFERENCES Departamento (idDepartamento),

    ADD CONSTRAINT fk_Bairro
        FOREIGN KEY (Bairro_idBairro)
            REFERENCES Bairro (idBairro);

ALTER TABLE Bairro
    ADD CONSTRAINT fk_Cidade
        FOREIGN KEY (Cidade_idCidade)
            REFERENCES Cidade (idCidade);

ALTER TABLE Cidade
    ADD CONSTRAINT fk_Estado
        FOREIGN KEY (Estado_idEstado)
            REFERENCES Estado (idEstado);

INSERT INTO Estado (nomeEstado)
VALUES ("Sao Paulo"),
       ("Rio de Janeiro"),
       ("Minas Gerais");

INSERT INTO Cidade (NomeCidade, Estado_idEstado)
VALUES ("Sao Jose dos Campos", 1),
       ("Jacarei", 1),
       ("Sao Paulo", 1),
       ("Niteroi", 2),
       ("Rio de Janeiro", 2),
       ("Belo Horizonte", 3);

INSERT INTO Bairro (NomeBairro, Cidade_idCidade)
VALUES ("Aquarius", 1),
       ("Urbanova", 1),
       ("Vila Branca", 2),
       ("Santo Amaro", 3),
       ("Moema", 3),
       ("Jardim Marajoara", 3),
       ("Itacoatiara", 4),
       ("Icarai", 4),
       ("Tijuca", 5),
       ("Ipanema", 5),
       ("Recreio", 5),
       ("Savassi", 6),
       ("Buritis", 6),
       ("Belvedere", 6);

INSERT INTO Departamento (NomeDepartamento)
VALUES ("Administrativo"),
       ("Financeiro"),
       ("RH"),
       ("Comercial"),
       ("Operacional");

INSERT INTO Cargo (NomeCargo, SalarioBase)
VALUES ("Presidencia", 50000),
       ("Gerencia", 20000),
       ("Tesouraria", 17500),
       ("Contabilidade", 7999.99),
       ("Gerente de RH", 3352.00),
       ("Analista de RH", 1927.00),
       ("Diretor comercial", 25000),
       ("Gerente comercial", 20000),
       ("TI", 13376.96),
       ("Engenheiro", 15000);

INSERT INTO Funcionario (nome, rg, cpf, telefone, endereco, Cargo_idCargo, Departamento_idDepartamento, Bairro_idBairro,
                         salario)
VALUES ("Eduardo Costa Filho", "24.402.855-95", "521.943.806-98", "(21) 0182-4008", "Rua Oliveira da Silva", 9, 5, 9,
        14000),
       ("Guilherme Santos", "406.530.085-11", "136.079.248-13", "(21) 4271-7750", "Avenida Vieira Souto", 1, 1, 10,
        60000),
       ("Núbia Martins", "161.855.865-09", "068.971.352-59", "(21) 7567-5857", "Avenida Lucio Costa", 8, 4, 11, 21000),
       ("Suélen Carvalho", "23.603.585-10", "580.674.319-57", "(21) 8564-0309", "Rua Marechal Olympio Falconiere", 3, 2,
        11, 18000),
       ("Maria Franco", "32.471.684-27", "721.940.356-99", "+55 (21) 0542-5061", "Rua Joaquim Nabuco", 7, 4, 10, 25000);

INSERT INTO Funcionario (nome, rg, cpf, telefone, endereco, Cargo_idCargo, Departamento_idDepartamento, Bairro_idBairro,
                         salario)
VALUES ("Thiago Silva", "417.535.712-27", "938.472.506-47", "(31) 33815-7488", "Avenida Getulio Vargas", 2, 1, 12,
        23000),
       ("Sr. Sirineu Costa", "866.533.707-55", "641.250.783-35", "+55 (31) 6494-9607", "Rua Consul Walter", 4, 2, 13,
        10000),
       ("Isabela Nogueira", "242.726.743-07", "624.905.187-20", "(31) 64130-3373", "Rua Lauro Ferreira", 5, 3, 13,
        5000),
       ("Natália Franco", "483.702.163-82", "710.826.345-90", "(31) 26030-8546", "Rua Ney Lambert", 9, 5, 14, 14000);

INSERT INTO Funcionario (nome, rg, cpf, telefone, endereco, Cargo_idCargo, Departamento_idDepartamento, Bairro_idBairro,
                         salario)
VALUES ("Sílvia Moreira", "530.007.177-30", "394.627.015-80", "+55 (12) 4566-9961", "Alameda Vivaldi", 1, 1, 1,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 1)),

       ("Salvador Souza", "613.480.244-10", "283.570.194-04", "(12) 0036-6803", "Av Papa Joao Paulo II", 2, 1, 2,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 2)),

       ("Rafael Moreira Neto", "413.816.304-21", "743.816.250-80", "+55 (12) 0604-3099", "Rua Valter Hugo Lemos", 3, 2,
        3, (SELECT SalarioBase FROM Cargo WHERE idCargo = 3)),

       ("Sirineu Melo", "463.821.075-90", "304.159.862-06", "(11) 5419-3739", "Rua Borba Gato", 4, 2, 4,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 4)),

       ("Gúbio Batista", "575.870.738-41", "298.103.674-22", "+55 (11) 7439-4184", "Rua Rouxinol", 5, 3, 5,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 5)),

       ("Carlos Moraes", "512.356.748-86", "581.643.279-64", "(11) 15106-4006", "Av. Manoel dos Reis Araujo", 6, 3, 6,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 6)),

       ("Elísio Nogueira", "775.568.767-80", "716.298.045-76", "+55 (21) 4575-6130", "Avenida Beira Mar", 7, 4, 7,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 7)),

       ("Meire Batista Filho", "170.207.148-03", "457.832.069-38", "(21) 8114-6700", "Rua Presidente Backer", 8, 4, 8,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 8)),

       ("Yango Oliveira", "265.880.230-73", "826.319.045-24", "(21) 55755-2901", "Avenida Uruguai", 9, 5, 9,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 9)),

       ("Fabrício Souza", "727.363.354-22", "230.417.856-17", "(21) 9457-3974", "Rua Prudente de Morais", 10, 5, 10,
        (SELECT SalarioBase FROM Cargo WHERE idCargo = 10));
