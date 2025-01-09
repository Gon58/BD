CREATE SCHEMA IF NOT EXISTS Fenix;
USE Fenix;


CREATE TABLE IF NOT EXISTS Agencia(
    ID INT AUTO_INCREMENT NOT NULL,
    Nr_Detetives INT NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    CodPostal VARCHAR(20) NOT NULL,
    Porta VARCHAR(10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Polo VARCHAR(2),
    PRIMARY KEY(ID)
);

CREATE TABLE IF NOT EXISTS Suspeito(
    ID INT AUTO_INCREMENT,
    Nome VARCHAR(200) NOT NULL,
    Historico TEXT NOT NULL,
    Descricao TEXT NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Codigo_Postal VARCHAR(20) NOT NULL,
    Porta VARCHAR(10) NOT NULL,
    PRIMARY KEY(ID)
);
CREATE TABLE IF NOT EXISTS Case_status (
    ID INT  AUTO_INCREMENT NOT NULL,
    Status VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Area(
     Area_ID INT AUTO_INCREMENT NOT NULL,
     Area VARCHAR(70) NOT NULL,
     PRIMARY KEY(Area_ID)
);

CREATE TABLE IF NOT EXISTS Patente(
    idPatente INT AUTO_INCREMENT,
    Designacao VARCHAR(50) NOT NULL,
    PRIMARY KEY(idPatente)
);

CREATE TABLE IF NOT EXISTS Cliente(
     ID INT AUTO_INCREMENT,
     Nome VARCHAR(200) NOT NULL,
     Contribuinte VARCHAR(9) NOT NULL,
     Data_nascimento DATE NOT NULL,
     Genero CHAR(1) NOT NULL,
     Telefone CHAR(13) NOT NULL,
     Email VARCHAR(100) NOT NULL,
     Agencia_ID INT NOT NULL,
     PRIMARY KEY(ID),
     FOREIGN KEY (Agencia_ID) REFERENCES Agencia (ID)
);

CREATE TABLE IF NOT EXISTS Caso (
    N_Registo INT AUTO_INCREMENT,
    Descricao TEXT NOT NULL,
    Case_Status INT NOT NULL,
    Data_abertura DATETIME NOT NULL,
    Data_fecho DATETIME,
    Cliente_ID INT NOT NULL,
    Area_ID INT NOT NULL,
    PRIMARY KEY(N_Registo),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente (ID),
    FOREIGN KEY (Area_ID) REFERENCES Area (Area_ID),
    FOREIGN KEY (Case_Status) REFERENCES Case_status (ID)
);


CREATE TABLE IF NOT EXISTS Evidencias(
    Evidencias_ID INT AUTO_INCREMENT,
    Evidencias TEXT NOT NULL,
    Caso_Nr_Registo INT NOT NULL,
    PRIMARY KEY(Evidencias_ID),
    FOREIGN KEY (Caso_Nr_Registo) REFERENCES Caso (N_Registo)
);

CREATE TABLE IF NOT EXISTS Detetive(
    NR INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Salario INT NOT NULL,
    Especializacao INT NOT NULL,
    nCasosResolvidos INT NOT NULL,
    nCasosAtribuidos INT NOT NULL,
    Supervisor_ID INT,
    Agencia_ID INT NOT NULL,
    Patente_ID INT NOT NULL,
    PRIMARY KEY(NR), 
    FOREIGN KEY (Patente_ID) REFERENCES Patente (idPatente),
    FOREIGN KEY (Supervisor_ID) REFERENCES Detetive (NR),
    FOREIGN KEY (Agencia_ID) REFERENCES Agencia (ID),
    FOREIGN KEY (Especializacao) REFERENCES Area (Area_ID)
);

CREATE TABLE IF NOT EXISTS Telefone(
    Agencia INT NOT NULL,
    Telefone_ID char(13) NOT NULL,
    PRIMARY KEY(Agencia,Telefone_ID),
    FOREIGN KEY (Agencia) REFERENCES Agencia(ID)
);

CREATE TABLE IF NOT EXISTS TelefoneDetetive(
    NR_detetive INT NOT NULL,
    Telefone char(13) NOT NULL,
    PRIMARY KEY(Telefone,NR_detetive),
    FOREIGN KEY (NR_detetive) REFERENCES Detetive(NR)
);

CREATE TABLE IF NOT EXISTS Tem (
    Caso_Nr_Registo INT NOT NULL,
    Agencia_ID INT NOT NULL,
    PRIMARY KEY (Caso_Nr_Registo, Agencia_ID),
    FOREIGN KEY (Caso_Nr_Registo) REFERENCES Caso (N_Registo),
    FOREIGN KEY (Agencia_ID) REFERENCES Agencia (ID)
);

CREATE TABLE IF NOT EXISTS Investiga(
    Detetive_Nr INT NOT NULL,
    Caso_Nr_Registo INT,
    PRIMARY KEY (Detetive_Nr,Caso_Nr_Registo),
    FOREIGN KEY (Detetive_Nr) REFERENCES Detetive (NR),
    FOREIGN KEY (Caso_Nr_Registo) REFERENCES Caso (N_Registo) 
);

CREATE TABLE IF NOT EXISTS Tem_associados(
    Caso_Nr_Registo INT NOT NULL,
    Suspeito_ID INT NOT NULL,
    PRIMARY KEY (Caso_Nr_Registo,Suspeito_ID),
    FOREIGN KEY (Caso_Nr_Registo) REFERENCES Caso (N_Registo),
    FOREIGN KEY (Suspeito_ID) REFERENCES Suspeito (ID)
);

CREATE INDEX Polo_Agencia ON Agencia(Polo);

CREATE INDEX Nome_Detetive ON Detetive(Nome);
