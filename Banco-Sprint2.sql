create database Sprint2;
use Sprint2;

create table Empresa(
	idEmpresa int primary key auto_increment,
	nome varchar(40),
    cnpj char(14) unique,
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
( idCamaraFresco int primary key,
fkEmpresa int,
CONSTRAINT fkEmpresaCamaraFresco FOREIGN KEY (fkEmpresa)
REFERENCES empresa(idEmpresa),  
SensorTemp float,
SensorUmid float,
HoraColeta datetime);

create table CamaraCongelado 
( idCamaraCongelado int primary key,
fkEmpresa int,
CONSTRAINT fkEmpresaCamaraCongelado FOREIGN KEY (fkEmpresa)
REFERENCES empresa(idEmpresa),  
SensorTemp float,
SensorUmid float,
HoraColeta datetime);