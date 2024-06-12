create database Sprint3;
use Sprint3;

create table Empresa
( idEmpresa int primary key auto_increment,
Nome varchar(40),
CNPJ char(14) unique,
CEP char(9),
numLogradouro char(4),
Complemento varchar(20),
UF char(2),
Telefone char(11),
Email varchar(50),
Token varchar(32) unique
);

create table Usuario
 ( idUsuario int primary key auto_increment,
 fkEmpresa int,
CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa)
REFERENCES Empresa(idEmpresa),
 Nome varchar(30),
 Email varchar(50) unique,
 CPF char(11) unique,
 TelefoneFixo char(9),
 TelefoneCelular char(11), 
 Senha varchar(30) unique
);

create table CamaraCaminhao 
( idCamaraCaminhao int primary key auto_increment,
fkEmpresa int,
CONSTRAINT fkEmpresaCamaraCaminhao FOREIGN KEY (fkEmpresa)
REFERENCES Empresa(idEmpresa),  
qtdPescados int,
Especie varchar(30)
);

create table Sensor
( idSensor int primary key auto_increment,
fkCamaraCaminhao int,
CONSTRAINT fkCamaraCaminhaoSensor FOREIGN KEY (fkCamaraCaminhao)
REFERENCES CamaraCaminhao(idCamaraCaminhao),
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

create table Intervalo
( idValor int primary key auto_increment,
fkSensor int,
CONSTRAINT fkSensorIntervalo FOREIGN KEY (fkSensor)
REFERENCES Sensor(idSensor),
minTemp INT,
constraint chkminTemp check (minTemp in ( 0)),
maxTemp INT,
constraint chkmaxTemp check (maxTemp in ( 2)),
minUmid INT,
constraint chkminUmid check (minUmid in ( 100)),
maxUmid INT,
constraint chkmaxUmid check (maxUmid in ( 50))
);

create table Alertas
( idAlertas int primary key auto_increment,
fkDados int,
CONSTRAINT fkDadosAlertas FOREIGN KEY (fkDados)
REFERENCES Dados(idDados),
fkSensor int,
CONSTRAINT fkSensorAlertas FOREIGN KEY (fkSensor)
REFERENCES Sensor(idSensor),
HoraAlerta DATETIME default current_timestamp
);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para as empresas fictícias
insert into Empresa (nome, cnpj, cep, numLogradouro, complemento, uf, telefone, email, token) 
values 
('Mar Pesca Ltda', '12345678000101', '00000000', '123', 'Bloco 42', 'RJ', '21987654321', 'contato@marpesca.com', md5(rand())),
('Aqua Transportes Ltda', '23456789000102', '00000000', '456', 'Galpão 61', 'SP', '11123456789', 'contato@aqua.com', md5(rand())),
('Pescados do Norte S/A', '34567890000103', '00000000', '789', 'Armazem 12', 'AM', '92987654321', 'contato@pescadosdonorte.com', md5(rand())),
('Peixaria Atlântico Ltda', '45678901000104', '00000000', '321', 'Bloco 39', 'BA', '71123456789', 'contato@peixariaatlantico.com', md5(rand())),
('OmegaFish', '68578254000125', '01414001', '451', 'Bloco 10', 'SP', '1135075226', 'contato@omegafish.com', 'b3752cdb2e64fc3232ea60b4e8f11975');
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert de Usuários nas empresas 
-- Empresa: Mar Pesca Ltda
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, cpf, fkEmpresa) 
values 
('Antônio Silva', 'antonio.silva@marpesca.com', '000000000', '21998765432', '#antonio123', '12345678910', 1),
('Luana Oliveira', 'luana.oliveira@marpesca.com', '000000000', '21987654321', '&luana456', '12345678911', 1),
('Rafael Santos', 'rafael.santos@marpesca.com', '000000000', '21987656789', '@rafael789', '12345678912', 1);

-- Empresa: Aqua Transportes Ltda
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, cpf, fkEmpresa)
values 
('Pedro Lima', 'pedro.lima@aqua.com', '000000000', '11998765432', '&pedro123', '12345678913',  2),
('Ana Souza', 'ana.souza@aqua.com', '000000000', '11987654321', '$ana456', '12345678914', 2),
('Márcio Oliveira', 'marcio.oliveira@aqua.com', '000000000', '11987656789', '#marcio789', '12345678915', 2);

-- Empresa: Pescados do Norte S/A
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, cpf, fkEmpresa)
values 
('Carla Santos', 'carla.santos@pescadosdonorte.com', '000000000', '92998765432', '&carla123', '12345678916', 3),
('Lucas Pereira', 'lucas.pereira@pescadosdonorte.com', '000000000', '92987654321', '%lucas456', '12345678917', 3),
('Fernanda Lima', 'fernanda.lima@pescadosdonorte.com', '000000000', '92987656789', '#fernanda789', '12345678918', 3);

-- Empresa: Peixaria Atlântico Ltda
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, cpf, fkEmpresa) 
values 
('Gustavo Silva', 'gustavo.silva@peixariaatlantico.com', '000000000', '71998765432', '@gustavo123', '12345678919', 4),
('Juliana Costa', 'juliana.costa@peixariaatlantico.com', '000000000', '71987654321', '%juliana456', '12345678920', 4),
('Diego Oliveira', 'diego.oliveira@peixariaatlantico.com', '000000000', '71987656789', '&diego789', '12345678921', 4);

-- OmegaFish
insert into Usuario (nome, email, telefoneFixo,telefoneCelular, senha, cpf, fkEmpresa) 
values 
('Suporte', 'suporte@omegafish.com', '000000000', '71998765432', '@Suporte10', '12345678987', 5);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela CamaraCaminhao
-- Empresa: Mar Pesca Ltda
insert into CamaraCaminhao (fkEmpresa, qtdPescados, Especie) 
values 
(1, 800, 'Tilápia');

-- Empresa: Aqua Transportes Ltda
insert into CamaraCaminhao (fkEmpresa, qtdPescados, Especie) 
values 
(2, 700, 'Tambaqui');

-- Empresa: Pescados do Norte S/A
insert into CamaraCaminhao (fkEmpresa, qtdPescados, Especie) 
values 
(3, 900, 'Pintado');

-- Empresa: Peixaria Atlântico Ltda
insert into CamaraCaminhao (fkEmpresa, qtdPescados, Especie) 
values 
(4, 1000, 'Dourado');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Sensor
-- Empresa: Mar Pesca Ltda
insert into Sensor (fkCamaraCaminhao, Modelo, UltimaManutencao) 
values 
(1, 'DHT11 Arduino Uno', '2024-03-20');

-- Empresa: Aqua Transportes Ltda
insert into Sensor (fkCamaraCaminhao, Modelo, UltimaManutencao) 
values 
(2, 'DHT11 Arduino Uno', '2024-02-15');

-- Empresa: Pescados do Norte S/A
insert into Sensor (fkCamaraCaminhao, Modelo, UltimaManutencao) 
values 
(3, 'DHT11 Arduino Uno', '2024-01-10');

-- Empresa: Peixaria Atlântico Ltda
insert into Sensor (fkCamaraCaminhao, Modelo, UltimaManutencao) 
values 
(4, 'DHT11 Arduino Uno', '2024-04-05');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserts para a tabela Dados
-- Empresa: Mar Pesca Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(1, 0.2, 52, '2024-04-01 08:00:00'), -- Fresco
(1, 0.6, 52, '2024-04-01 08:00:02'),
(1, 1.5, 52, '2024-04-01 08:00:04'),
(1, 0.4, 53, '2024-04-01 08:00:06'),
(1, 0.9, 53, '2024-04-01 08:00:08'),
(1, 2.5, 53, '2024-04-01 08:00:10');

-- Empresa: Aqua Transportes Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(2, 0.2, 52, '2024-04-01 09:00:00'), -- Fresco
(2, 0.6, 52, '2024-04-01 09:00:02'),
(2, 1.5, 52, '2024-04-01 09:00:04'),
(2, 0.4, 53, '2024-04-01 09:00:06'),
(2, 0.9, 53, '2024-04-01 09:00:08'),
(2, 2.5, 53, '2024-04-01 09:00:10');
-- Empresa: Pescados do Norte S/A
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(3, 0.2, 52, '2024-04-01 10:00:00'), -- Fresco
(3, 0.6, 52, '2024-04-01 10:00:02'),
(3, 1.5, 52, '2024-04-01 10:00:04'),
(3, 0.4, 53, '2024-04-01 10:00:06'),
(3, 0.9, 53, '2024-04-01 10:00:08'),
(3, 2.5, 53, '2024-04-01 10:00:10');

-- Empresa: Peixaria Atlântico Ltda
insert into Dados (fkSensor, SensorTemp, SensorUmid, HoraColeta) 
values 
(4, 0.2, 52, '2024-04-01 11:00:00'), -- Fresco
(4, 0.6, 52, '2024-04-01 11:00:02'),
(4, 1.5, 52, '2024-04-01 11:00:04'),
(4, 0.4, 53, '2024-04-01 11:00:06'),
(4, 0.9, 53, '2024-04-01 11:00:08'),
(4, 2.5, 53, '2024-04-01 11:00:10');
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Valores mínimos e máximos: Temperatura e Umidade - Fresco e Congelado
insert into Intervalo (fkSensor, minTemp, maxTemp, minUmid, maxUmid) values
(1, 0, 2, 100, 50),
(2, 0, 2, 100, 50),
(3, 0, 2, 100, 50),
(4, 0, 2, 100, 50);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Alertas inseridos no banco
insert into Alertas (fkDados, fkSensor, HoraAlerta) values
(6, 1, '2024-04-01 10:00:00' ),
(12, 2, '2024-04-01 09:30:00' ),
(18, 3, '2024-04-01 10:30:00' ),
(24, 4, '2024-04-01 11:30:00' );
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Comandos:

-- Seleção de Celsius para Farenheit:
select 
    SensorTemp,
    round((SensorTemp * 9 / 5) + 32) as MetricaFahrenheit
from 
    Dados;


-- Automatizar geração de tokens:
CREATE EVENT gerar_token 
ON SCHEDULE EVERY 15 DAY 
ENABLE
DO
    UPDATE Empresa SET token = MD5(RAND());
    
-- Exibir tudo Empresa:
select * from Empresa;

-- Exibir tudo Usuário:
select * from Usuario;

-- Exibir tudo CâmaraCaminhão:
select * from CamaraCaminhao;

-- Exibir tudo Sensor:
select * from Sensor;

-- Exibir tudo Dados:
select * from Dados;

-- Exibir tudo Intervalo:
select * from Intervalo;

-- Exibir tudo Alertas:
select * from Alertas;

-- Selecionar todas as empresas e seus respectivos usuários:
select Empresa.nome as 'Nome da Empresa', Usuario.nome as 'Nome do Usuário', Usuario.email, Usuario.telefoneCelular, Usuario.telefoneFixo
from Empresa 
join Usuario on idEmpresa = fkEmpresa;
