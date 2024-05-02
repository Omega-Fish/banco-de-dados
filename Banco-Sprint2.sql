create database Sprint2;
use Sprint2;

create table Empresa
( idEmpresa int primary key auto_increment,
nome varchar(40),
cnpj char(14) unique,
cep char(9),
numLogradouro char(4),
complemento varchar(20),
uf char(2),
telefone char(15),
email varchar(50),
token varchar(32) unique
);

create table Usuario
 ( idUsuario int primary key auto_increment,
 fkEmpresa int,
CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa)
REFERENCES Empresa(idEmpresa),
 nome varchar(20),
 email varchar(50) unique,
 telefoneFixo char(10),
 telefoneCelular char(15), 
 senha varchar(30) unique
);

create table Camara 
( idCamara int primary key auto_increment,
fkEmpresa int,
CONSTRAINT fkEmpresaCamara FOREIGN KEY (fkEmpresa)
REFERENCES Empresa(idEmpresa),  
qtdPescados int,
Especie varchar(30)
);

create table Sensor
( idSensor int primary key auto_increment,
fkCamara int,
CONSTRAINT fkCamaraSensor FOREIGN KEY (fkCamara)
REFERENCES Camara(idCamara),
Modelo varchar(25),
UltimaManutencao DATE
);

create table Dados
( idDados int auto_increment,
fkSensor int,
CONSTRAINT pkSensorDados PRIMARY KEY (idDados, fkSensor),
CONSTRAINT fkSensorDados FOREIGN KEY (fkSensor)
REFERENCES Sensor(idSensor),
SensorTemp FLOAT,
SensorUmid FLOAT,
HoraColeta DATETIME default current_timestamp
);

create table Valor
( idValor int auto_increment,
fkSensor int,
CONSTRAINT pkSensorDados PRIMARY KEY (idValor, fkSensor),
CONSTRAINT fkSensorValor FOREIGN KEY (fkSensor)
REFERENCES Sensor(idSensor),
minTemp INT,
constraint chkminTemp check (minTemp in ( 0)),
maxTemp INT,
constraint chkmaxTemp check (maxTemp in ( 2)),
minUmid INT,
constraint chkminUmid check (minUmid in ( 52)),
maxUmid INT,
constraint chkmaxUmid check (maxUmid in ( 53))
);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para as empresas fictícias
insert into Empresa (nome, cnpj, cep, numLogradouro, complemento, uf, telefone, email, token) 
values 
('Mar Pesca Ltda', '12345678000101', '00000-000', '123', 'Bloco 42', 'RJ', '(21) 98765-4321', 'contato@marpesca.com', md5(rand())),
('Aqua Transportes Ltda', '23456789000102', '00000-000', '456', 'Galpão 61', 'SP', '(11) 12345-6789', 'contato@aqua.com', md5(rand())),
('Pescados do Norte S/A', '34567890000103', '00000-000', '789', 'Armazem 12', 'AM', '(92) 98765-4321', 'contato@pescadosdonorte.com', md5(rand())),
('Peixaria Atlântico Ltda', '45678901000104', '00000-000', '321', 'Bloco 39', 'BA', '(71) 12345-6789', 'contato@peixariaatlantico.com', md5(rand()));
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert de Usuários nas empresas 
-- Empresa: Mar Pesca Ltda
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, fkEmpresa) 
values 
('Antônio Silva', 'antonio.silva@marpesca.com', 'XXXX-XXXX', '(21) 99876-5432', 'antonio123', 1),
('Luana Oliveira', 'luana.oliveira@marpesca.com', 'XXXX-XXXX', '(21) 98765-4321', 'luana456', 1),
('Rafael Santos', 'rafael.santos@marpesca.com', 'XXXX-XXXX', '(21) 98765-6789', 'rafael789', 1);

-- Empresa: Aqua Transportes Ltda
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, fkEmpresa)
values 
('Pedro Lima', 'pedro.lima@aqua.com', 'XXXX-XXXX', '(11) 99876-5432', 'pedro123', 2),
('Ana Souza', 'ana.souza@aqua.com', 'XXXX-XXXX', '(11) 98765-4321', 'ana456', 2),
('Márcio Oliveira', 'marcio.oliveira@aqua.com', 'XXXX-XXXX', '(11) 98765-6789', 'marcio789', 2);

-- Empresa: Pescados do Norte S/A
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, fkEmpresa)
values 
('Carla Santos', 'carla.santos@pescadosdonorte.com', 'XXXX-XXXX', '(92) 99876-5432', 'carla123', 3),
('Lucas Pereira', 'lucas.pereira@pescadosdonorte.com', 'XXXX-XXXX', '(92) 98765-4321', 'lucas456', 3),
('Fernanda Lima', 'fernanda.lima@pescadosdonorte.com', 'XXXX-XXXX', '(92) 98765-6789', 'fernanda789', 3);

-- Empresa: Peixaria Atlântico Ltda
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, fkEmpresa) 
values 
('Gustavo Silva', 'gustavo.silva@peixariaatlantico.com', 'XXXX-XXXX', '(71) 99876-5432', 'gustavo123', 4),
('Juliana Costa', 'juliana.costa@peixariaatlantico.com', 'XXXX-XXXX', '(71) 98765-4321', 'juliana456', 4),
('Diego Oliveira', 'diego.oliveira@peixariaatlantico.com', 'XXXX-XXXX', '(71) 98765-6789', 'diego789', 4);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Camara
-- Empresa: Mar Pesca Ltda
insert into Camara (fkEmpresa, qtdPescados, Especie) 
values 
(1, 800, 'Tilápia');

-- Empresa: Aqua Transportes Ltda
insert into Camara (fkEmpresa, qtdPescados, Especie) 
values 
(2, 700, 'Tambaqui');

-- Empresa: Pescados do Norte S/A
insert into Camara (fkEmpresa, qtdPescados, Especie) 
values 
(3, 900, 'Pintado');

-- Empresa: Peixaria Atlântico Ltda
insert into Camara (fkEmpresa, qtdPescados, Especie) 
values 
(4, 1000, 'Dourado');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Sensor
-- Empresa: Mar Pesca Ltda
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(1, 'DHT11 Arduino Uno', '2024-03-20');

-- Empresa: Aqua Transportes Ltda
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(2, 'DHT11 Arduino Uno', '2024-02-15');

-- Empresa: Pescados do Norte S/A
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(3, 'DHT11 Arduino Uno', '2024-01-10');

-- Empresa: Peixaria Atlântico Ltda
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(4, 'DHT11 Arduino Uno', '2024-04-05');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Dados
-- Empresa: Mar Pesca Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(1, 0.2, 52, '2024-04-01 08:00:00'), -- Fresco
(1, 0.6, 52, '2024-04-01 08:30:00'),
(1, 1.5, 52, '2024-04-01 09:00:00'),
(1, 0.4, 53, '2024-04-01 09:30:00'),
(1, 0.9, 53, '2024-04-01 10:00:00');

-- Empresa: Aqua Transportes Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(2, 0.2, 52, '2024-04-01 08:00:00'), -- Fresco
(2, 0.6, 52, '2024-04-01 08:30:00'),
(2, 1.5, 52, '2024-04-01 09:00:00'),
(2, 0.4, 53, '2024-04-01 09:30:00'),
(2, 0.9, 53, '2024-04-01 10:00:00');
-- Empresa: Pescados do Norte S/A
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(3, 0.2, 52, '2024-04-01 08:00:00'), -- Fresco
(3, 0.6, 52, '2024-04-01 08:30:00'),
(3, 1.5, 52, '2024-04-01 09:00:00'),
(3, 0.4, 53, '2024-04-01 09:30:00'),
(3, 0.9, 53, '2024-04-01 10:00:00');

-- Empresa: Peixaria Atlântico Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(4, 0.2, 52, '2024-04-01 08:00:00'), -- Fresco
(4, 0.6, 52, '2024-04-01 08:30:00'),
(4, 1.5, 52, '2024-04-01 09:00:00'),
(4, 0.4, 53, '2024-04-01 09:30:00'),
(4, 0.9, 53, '2024-04-01 10:00:00');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Valores mínimos e máximos: Temperatura e Umidade - Fresco e Congelado
insert into Valor (fkSensor, minTemp, maxTemp, minUmid, maxUmid) values
(1, 0, 2, 52, 53),
(2, 0, 2, 52, 53),
(3, 0, 2, 52, 53),
(4, 0, 2, 52, 53);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Comandos:

-- Exibir tudo Empresa:
select * from Empresa;

-- Exibir tudo Usuário:
select * from Usuario;

-- Exibir tudo Câmara:
select * from Camara;

-- Exibir tudo Sensor:
select * from Sensor;

-- Exibir tudo Dados:
select * from Dados;

-- Exibir tudo Valor:
select * from Valor;

-- Selecionar todas as empresas e seus respectivos usuários:
select Empresa.nome as 'Nome da Empresa', Usuario.nome as 'Nome do Usuário', Usuario.email, Usuario.telefoneCelular, Usuario.telefoneFixo
from Empresa 
join Usuario on idEmpresa = fkEmpresa;
