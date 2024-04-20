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
 nome varchar(20),
 email varchar(50) unique,
 telefone char(15), 
 senha varchar(30) unique, 
 fkEmpresa int,
CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa)
REFERENCES Empresa(idEmpresa)
);

create table Camara 
( idCamara int primary key auto_increment,
fkEmpresa int,
CONSTRAINT fkEmpresaCamara FOREIGN KEY (fkEmpresa)
REFERENCES Empresa(idEmpresa),  
qtdPescados int,
Especie varchar(30),
tipoCamara varchar(15),
constraint chkTipoCamara check (tipoCamara in ('fresco','congelado'))
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
insert into Usuario (nome, email, telefone, senha, fkEmpresa) 
values 
('Antônio Silva', 'antonio.silva@marpesca.com', '(21) 99876-5432', 'antonio123', 1),
('Luana Oliveira', 'luana.oliveira@marpesca.com', '(21) 98765-4321', 'luana456', 1),
('Rafael Santos', 'rafael.santos@marpesca.com', '(21) 98765-6789', 'rafael789', 1);

-- Empresa: Aqua Transportes Ltda
insert into Usuario (nome, email, telefone, senha, fkEmpresa) 
values 
('Pedro Lima', 'pedro.lima@aqua.com', '(11) 99876-5432', 'pedro123', 2),
('Ana Souza', 'ana.souza@aqua.com', '(11) 98765-4321', 'ana456', 2),
('Márcio Oliveira', 'marcio.oliveira@aqua.com', '(11) 98765-6789', 'marcio789', 2);

-- Empresa: Pescados do Norte S/A
insert into Usuario (nome, email, telefone, senha, fkEmpresa) 
values 
('Carla Santos', 'carla.santos@pescadosdonorte.com', '(92) 99876-5432', 'carla123', 3),
('Lucas Pereira', 'lucas.pereira@pescadosdonorte.com', '(92) 98765-4321', 'lucas456', 3),
('Fernanda Lima', 'fernanda.lima@pescadosdonorte.com', '(92) 98765-6789', 'fernanda789', 3);

-- Empresa: Peixaria Atlântico Ltda
insert into Usuario (nome, email, telefone, senha, fkEmpresa) 
values 
('Gustavo Silva', 'gustavo.silva@peixariaatlantico.com', '(71) 99876-5432', 'gustavo123', 4),
('Juliana Costa', 'juliana.costa@peixariaatlantico.com', '(71) 98765-4321', 'juliana456', 4),
('Diego Oliveira', 'diego.oliveira@peixariaatlantico.com', '(71) 98765-6789', 'diego789', 4);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Camara
-- Empresa: Mar Pesca Ltda
insert into Camara (fkEmpresa, qtdPescados, Especie, tipoCamara) 
values 
(1, 800, 'Tilápia', 'fresco'),
(1, 600, 'Salmão', 'congelado');

-- Empresa: Aqua Transportes Ltda
insert into Camara (fkEmpresa, qtdPescados, Especie, tipoCamara) 
values 
(2, 700, 'Tambaqui', 'fresco'),
(2, 500, 'Robalo', 'congelado');

-- Empresa: Pescados do Norte S/A
insert into Camara (fkEmpresa, qtdPescados, Especie, tipoCamara) 
values 
(3, 900, 'Pintado', 'fresco'),
(3, 400, 'Linguado', 'congelado');

-- Empresa: Peixaria Atlântico Ltda
insert into Camara (fkEmpresa, qtdPescados, Especie, tipoCamara) 
values 
(4, 1000, 'Dourado', 'fresco'),
(4, 300, 'Pescada', 'congelado');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Sensor
-- Empresa: Mar Pesca Ltda
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(1, 'DHT11 Arduino Uno', '2024-03-20'),
(2, 'DHT11 Arduino Uno', '2024-03-20');

-- Empresa: Aqua Transportes Ltda
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(3, 'DHT11 Arduino Uno', '2024-02-15'),
(4, 'DHT11 Arduino Uno', '2024-02-15');

-- Empresa: Pescados do Norte S/A
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(5, 'DHT11 Arduino Uno', '2024-01-10'),
(6, 'DHT11 Arduino Uno', '2024-01-10');

-- Empresa: Peixaria Atlântico Ltda
insert into Sensor (fkCamara, Modelo, UltimaManutencao) 
values 
(7, 'DHT11 Arduino Uno', '2024-04-05'),
(8, 'DHT11 Arduino Uno', '2024-04-05');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Dados
-- Empresa: Mar Pesca Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(1, 10.5, 65, '2024-04-01 08:00:00'), -- Fresco
(1, 11.2, 62, '2024-04-01 08:30:00'),
(1, 11.8, 60, '2024-04-01 09:00:00'),
(1, 10.3, 64, '2024-04-01 09:30:00'),
(1, 10.1, 63, '2024-04-01 10:00:00'),
(2, -18.5, 45, '2024-04-01 08:00:00'), -- Congelado
(2, -18.2, 46, '2024-04-01 09:00:00'),
(2, -17.8, 47, '2024-04-01 10:00:00'),
(2, -17.3, 48, '2024-04-01 11:00:00'),
(2, -17.0, 49, '2024-04-01 12:00:00');

-- Empresa: Aqua Transportes Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(3, 9.8, 68, '2024-04-01 08:00:00'), -- Fresco
(3, 10.2, 66, '2024-04-01 08:30:00'),
(3, 10.5, 64, '2024-04-01 09:00:00'),
(3, 9.7, 67, '2024-04-01 09:30:00'),
(3, 9.5, 65, '2024-04-01 10:00:00'),
(4, -20.0, 42, '2024-04-01 08:00:00'), -- Congelado
(4, -20.3, 43, '2024-04-01 09:00:00'),
(4, -20.5, 44, '2024-04-01 10:00:00'),
(4, -20.8, 45, '2024-04-01 11:00:00'),
(4, -21.0, 46, '2024-04-01 12:00:00');

-- Empresa: Pescados do Norte S/A
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(5, 11.1, 62, '2024-04-01 08:00:00'), -- Fresco
(5, 11.5, 60, '2024-04-01 08:30:00'),
(5, 11.9, 58, '2024-04-01 09:00:00'),
(5, 11.3, 61, '2024-04-01 09:30:00'),
(5, 11.0, 63, '2024-04-01 10:00:00'),
(6, -19.0, 44, '2024-04-01 08:00:00'), -- Congelado
(6, -19.2, 45, '2024-04-01 09:00:00'),
(6, -19.5, 46, '2024-04-01 10:00:00'),
(6, -19.8, 47, '2024-04-01 11:00:00'),
(6, -20.0, 48, '2024-04-01 12:00:00');

-- Empresa: Peixaria Atlântico Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(7, 10.2, 67, '2024-04-01 08:00:00'), -- Fresco
(7, 10.6, 65, '2024-04-01 08:30:00'),
(7, 11.0, 63, '2024-04-01 09:00:00'),
(7, 10.4, 66, '2024-04-01 09:30:00'),
(7, 10.1, 68, '2024-04-01 10:00:00'),
(8, -17.5, 47, '2024-04-01 08:00:00'), -- Congelado
(8, -17.2, 48, '2024-04-01 09:00:00'),
(8, -16.8, 49, '2024-04-01 10:00:00'),
(8, -16.3, 50, '2024-04-01 11:00:00'),
(8, -16.0, 51, '2024-04-01 12:00:00');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Comandos:

-- Automatizar geração de tokens:
CREATE EVENT gerar_token 
ON SCHEDULE EVERY 15 DAY 
ENABLE
DO
    UPDATE Empresa SET token = MD5(RAND());
    
-- Mostrar evento funcionando:
show events;

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

-- Selecionar todas as empresas e seus respectivos usuários:
select Empresa.nome as 'Nome da Empresa', Usuario.nome as 'Nome do Usuário', Usuario.email, Usuario.telefone
from Empresa 
join Usuario on idEmpresa = fkEmpresa;
