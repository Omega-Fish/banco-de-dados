create database Sprint2;
use Sprint2;

create table Empresa
( idEmpresa int primary key auto_increment,
nome varchar(40),
cnpj char(18) unique,
logradouro varchar(60),
uf char(2),
telefone char(15),
email varchar(50),
senha varchar(30) unique);

create table Usuario
 ( idUsuario int primary key auto_increment,
 nome varchar(20),
 email varchar(50) unique,
 telefone char(15), 
 senha varchar(30) unique,
 cargo varchar(30), 
 fkEmpresa int,
CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa)
REFERENCES empresa(idEmpresa));  

create table CamaraFresco 
( idCamaraFresco int primary key auto_increment,
fkEmpresa int,
CONSTRAINT fkEmpresaCamaraFresco FOREIGN KEY (fkEmpresa)
REFERENCES empresa(idEmpresa),  
SensorTemp float,
SensorUmid float,
HoraColeta datetime);

create table CamaraCongelado 
( idCamaraCongelado int primary key auto_increment,
fkEmpresa int,
CONSTRAINT fkEmpresaCamaraCongelado FOREIGN KEY (fkEmpresa)
REFERENCES empresa(idEmpresa),  
SensorTemp float,
SensorUmid float,
HoraColeta datetime);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para as empresas fictícias
insert into Empresa (nome, cnpj, logradouro, uf, telefone, email, senha) 
values 
('Mar Pesca Ltda', '12.345.678/0001-01', 'Rua dos Pescadores, 123', 'RJ', '(21) 98765-4321', 'contato@marpesca.com', 'senha1234'),
('Aqua Transportes Ltda', '23.456.789/0001-02', 'Av. das Águas, 456', 'SP', '(11) 12345-6789', 'contato@aqua.com', 'senha5678'),
('Pescados do Norte S/A', '34.567.890/0001-03', 'Estrada dos Peixes, 789', 'AM', '(92) 98765-4321', 'contato@pescadosdonorte.com', 'senhaabcd'),
('Peixaria Atlântico Ltda', '45.678.901/0001-04', 'Avenida do Mar, 321', 'BA', '(71) 12345-6789', 'contato@peixariaatlantico.com', 'senha9876');
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert de Usuários nas empresas
-- Empresa: Mar Pesca Ltda
insert into Usuario (nome, email, telefone, senha, cargo, fkEmpresa) 
values 
('Antônio Silva', 'antonio.silva@marpesca.com', '(21) 99876-5432', 'antonio123', 'Proprietário', 1),
('Luana Oliveira', 'luana.oliveira@marpesca.com', '(21) 98765-4321', 'luana456', 'Operador', 1),
('Rafael Santos', 'rafael.santos@marpesca.com', '(21) 98765-6789', 'rafael789', 'Motorista', 1);

-- Empresa: Aqua Transportes Ltda
insert into Usuario (nome, email, telefone, senha, cargo, fkEmpresa) 
values 
('Pedro Lima', 'pedro.lima@aqua.com', '(11) 99876-5432', 'pedro123', 'Proprietário', 2),
('Ana Souza', 'ana.souza@aqua.com', '(11) 98765-4321', 'ana456', 'Operador', 2),
('Márcio Oliveira', 'marcio.oliveira@aqua.com', '(11) 98765-6789', 'marcio789', 'Motorista', 2);

-- Empresa: Pescados do Norte S/A
insert into Usuario (nome, email, telefone, senha, cargo, fkEmpresa) 
values 
('Carla Santos', 'carla.santos@pescadosdonorte.com', '(92) 99876-5432', 'carla123', 'Proprietário', 3),
('Lucas Pereira', 'lucas.pereira@pescadosdonorte.com', '(92) 98765-4321', 'lucas456', 'Operador', 3),
('Fernanda Lima', 'fernanda.lima@pescadosdonorte.com', '(92) 98765-6789', 'fernanda789', 'Motorista', 3);

-- Empresa: Peixaria Atlântico Ltda
insert into Usuario (nome, email, telefone, senha, cargo, fkEmpresa) 
values 
('Gustavo Silva', 'gustavo.silva@peixariaatlantico.com', '(71) 99876-5432', 'gustavo123', 'Proprietário', 4),
('Juliana Costa', 'juliana.costa@peixariaatlantico.com', '(71) 98765-4321', 'juliana456', 'Operador', 4),
('Diego Oliveira', 'diego.oliveira@peixariaatlantico.com', '(71) 98765-6789', 'diego789', 'Motorista', 4);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela CamaraFresco
-- Empresa: Mar Pesca Ltda
insert into CamaraFresco (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(1, 10.5, 65, '2024-04-01 08:00:00'),
(1, 11.2, 62, '2024-04-01 08:30:00'),
(1, 11.8, 60, '2024-04-01 09:00:00'),
(1, 10.3, 64, '2024-04-01 09:30:00'),
(1, 10.1, 63, '2024-04-01 10:00:00');

-- Empresa: Aqua Transportes Ltda
insert into CamaraFresco (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(2, 9.8, 68, '2024-04-01 08:00:00'),
(2, 10.2, 66, '2024-04-01 08:30:00'),
(2, 10.5, 64, '2024-04-01 09:00:00'),
(2, 9.7, 67, '2024-04-01 09:30:00'),
(2, 9.5, 65, '2024-04-01 10:00:00');

-- Empresa: Pescados do Norte S/A
insert into CamaraFresco (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(3, 11.1, 62, '2024-04-01 08:00:00'),
(3, 11.5, 60, '2024-04-01 08:30:00'),
(3, 11.9, 58, '2024-04-01 09:00:00'),
(3, 11.3, 61, '2024-04-01 09:30:00'),
(3, 11.0, 63, '2024-04-01 10:00:00');

-- Empresa: Peixaria Atlântico Ltda
insert into CamaraFresco (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(4, 10.2, 67, '2024-04-01 08:00:00'),
(4, 10.6, 65, '2024-04-01 08:30:00'),
(4, 11.0, 63, '2024-04-01 09:00:00'),
(4, 10.4, 66, '2024-04-01 09:30:00'),
(4, 10.1, 68, '2024-04-01 10:00:00');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela CamaraCongelado
-- Empresa: Mar Pesca Ltda
insert into CamaraCongelado (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(1, -18.5, 45, '2024-04-01 08:00:00'),
(1, -18.2, 46, '2024-04-01 09:00:00'),
(1, -17.8, 47, '2024-04-01 10:00:00'),
(1, -17.3, 48, '2024-04-01 11:00:00'),
(1, -17.0, 49, '2024-04-01 12:00:00');

-- Empresa: Aqua Transportes Ltda
insert into CamaraCongelado (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(2, -20.0, 42, '2024-04-01 08:00:00'),
(2, -20.3, 43, '2024-04-01 09:00:00'),
(2, -20.5, 44, '2024-04-01 10:00:00'),
(2, -20.8, 45, '2024-04-01 11:00:00'),
(2, -21.0, 46, '2024-04-01 12:00:00');

-- Empresa: Pescados do Norte S/A
insert into CamaraCongelado (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(3, -19.0, 44, '2024-04-01 08:00:00'),
(3, -19.2, 45, '2024-04-01 09:00:00'),
(3, -19.5, 46, '2024-04-01 10:00:00'),
(3, -19.8, 47, '2024-04-01 11:00:00'),
(3, -20.0, 48, '2024-04-01 12:00:00');

-- Empresa: Peixaria Atlântico Ltda
insert into CamaraCongelado (fkEmpresa, SensorTemp, SensorUmid, HoraColeta) 
values 
(4, -17.5, 47, '2024-04-01 08:00:00'),
(4, -17.2, 48, '2024-04-01 09:00:00'),
(4, -16.8, 49, '2024-04-01 10:00:00'),
(4, -16.3, 50, '2024-04-01 11:00:00'),
(4, -16.0, 51, '2024-04-01 12:00:00');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Comandos:
-- Exibir tudo Empresa:
select * from Empresa;

-- Exibir tudo Usuário:
select * from Usuario;

-- Exibir tudo Câmara de congelados:
select * from CamaraCongelado;

-- Exibir tudo Câmara de frescos:
select * from CamaraFresco;

-- Selecionar todas as empresas e seus respectivos usuários:
select Empresa.nome as 'Nome da Empresa', Usuario.nome as 'Nome do Usuário', Usuario.email, Usuario.telefone, Usuario.cargo 
from Empresa 
join Usuario on idEmpresa = fkEmpresa;

-- Selecionar os sensores de temperatura e umidade das câmaras de fresco para uma empresa específica (por exemplo, Aqua Transportes Ltda):
select Empresa.nome as 'Empresa',CamaraFresco.SensorTemp, CamaraFresco.SensorUmid, CamaraFresco.HoraColeta 
from CamaraFresco 
inner join Empresa on fkEmpresa = idEmpresa 
where nome = 'Aqua Transportes Ltda';
