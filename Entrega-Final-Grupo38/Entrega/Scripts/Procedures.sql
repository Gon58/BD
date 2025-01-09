Use Fenix;

DELIMITER $$

CREATE PROCEDURE DetetivesPorClassificacao(IN p_Especializacao INT)
BEGIN
    SELECT Detetive.*, CalculaRatio(Detetive.nCasosResolvidos, Detetive.nCasosAtribuidos) AS Ratio
    FROM Detetive
    WHERE Detetive.Especializacao = p_Especializacao
    ORDER BY Ratio DESC;
END$$

CREATE PROCEDURE DetetivesPorCaso(IN CasoID INT)
BEGIN
    SELECT *
    FROM Detetive
    INNER JOIN Caso ON Detetive.ID = CasoID
    ORDER BY Detetive.ID ASC;
END$$


CREATE PROCEDURE AtualizaStatusCaso(IN case_status INT, IN Caso_Nr_Registo INT)
BEGIN
    IF case_status IN (2,3) THEN
        UPDATE Caso
        SET Case_Status = case_status,
            Data_Fecho = CURRENT_DATE()
        WHERE N_Registo = Caso_Nr_Registo;
    ELSE
        UPDATE Caso
        SET Case_Status = case_status
        WHERE N_Registo = Caso_Nr_Registo;
    END IF;
END$$


CREATE PROCEDURE AssociaDetetiveCaso(IN pDetetive_Nr INT, IN pCaso_Nr_Registo INT)
BEGIN
    INSERT INTO Investiga (Detetive_Nr, Caso_Nr_Registo) 
    VALUES (pDetetive_Nr, pCaso_Nr_Registo);
END $$


CREATE PROCEDURE AtualizaEvidencia(IN p_Evidencia_ID INT, IN p_Evidencias TEXT)
BEGIN
    UPDATE Evidencia
    SET Evidencias = p_Evidencias
    WHERE ID = p_Evidencia_ID;
END$$

CREATE PROCEDURE AtualizaDescricao(IN p_Caso_ID INT, IN p_Descricao TEXT)
BEGIN 
    UPDATE Caso
    SET Descricao = p_Descricao
    WHERE ID = p_Caso_ID;
END$$

CREATE PROCEDURE EvidenciasCaso(IN p_Caso_ID INT)
BEGIN
    SELECT Evidencias
    FROM Evidencia
    WHERE Caso_ID = p_Caso_ID;
END$$

CREATE PROCEDURE InserirDetetive(
    IN pNome VARCHAR(100),
    IN pSalario INT,
    IN pEspecializacao INT,
    IN pCasosResolvidos INT,
    IN pCasosAtribuidos INT,
    IN pSupervisorID INT,
    IN pAgenciaID INT,
    IN pPatenteID INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Detetive WHERE Nome = pNome
    ) THEN
        INSERT INTO Detetive (Nome,Salario, Especializacao, nCasosResolvidos, nCasosAtribuidos, Supervisor, Agencia_ID, Patente_ID)
        VALUES (pNome,pSalario,pEspecializacao, pCasosResolvidos, pCasosAtribuidos, pSupervisorID, pAgenciaID, pPatenteID); 
    END IF;
END $$


CREATE PROCEDURE AssociaCasoSuspeito(IN pCaso_Nr_Registo INT, IN pSuspeitoID INT)
BEGIN
	INSERT INTO Tem_associados (Caso_Nr_Registo, Suspeito_ID)
    VALUES (pCaso_Nr_Registo, pSuspeitoID);
END $$

CREATE PROCEDURE AssociaCasoAgencia(IN pCaso_Nr_Registo INT, IN pAgenciaID INT)
BEGIN
	INSERT INTO Tem (Caso_Nr_Registo, Agencia_ID)
    VALUES (pCaso_Nr_Registo, pAgenciaID);
END $$


CREATE PROCEDURE NumCasosDetetives(IN nomeDetetive VARCHAR(100))
BEGIN
    SELECT D.Id_Detive,
           D.Nome,
           D.nCasosAtribuidos,
           D.nCasosResolvidos
    FROM Detetive as D 
    WHERE D.Nome = nomeDetetive;
END $$

    CREATE PROCEDURE InserirCaso(
     IN n_Descricao TEXT,
     IN n_Case_Status INT,
     IN n_Data_abertura DATETIME,
     IN n_Data_fecho DATETIME,
     IN n_Cliente_ID INT,
     IN n_Agencia_ID INT
    )
    BEGIN
        INSERT INTO Caso (Descricao, Case_Status, Data_abertura, Data_fecho, Cliente_ID, Agencia_ID)
        VALUES (n_Descricao, n_Case_Status, n_Data_abertura, n_Data_fecho, n_Cliente_ID, n_Agencia_ID);
    END $$

    CREATE PROCEDURE InserirAgencia(
     IN n_Nr_Detetives INT,
     IN n_Rua VARCHAR(100),
     IN n_CodPostal VARCHAR(20),
     IN n_Porta VARCHAR(10),
     IN n_Email VARCHAR(100),
     IN n_Polo VARCHAR(2)
    )
    BEGIN
        INSERT INTO Agencia (Nr_Detetives, Rua, CodPostal, Porta, Email, Polo)
        VALUES (n_Nr_Detetives, n_Rua, n_CodPostal, n_Porta, n_Email, n_Polo);
    END $$


    CREATE PROCEDURE InserirSuspeito(
     IN n_Nome VARCHAR(200),
     IN n_Historico TEXT,
     IN n_Descricao INT,
     IN n_Rua VARCHAR(100),
     IN n_Codigo_Postal VARCHAR(20),
     IN n_Porta VARCHAR(10)
    )
    BEGIN
        INSERT INTO Suspeito (Nome, Historico, Descricao, Rua, Codigo_Postal, Porta)
        VALUES (n_Nome, n_Historico, n_Descricao, n_Rua, n_Codigo_Postal, n_Porta);
    END$$
    
    CREATE PROCEDURE InserirCliente(
     IN pNome VARCHAR(200) ,
     IN pContribuinte VARCHAR(9) ,
     IN pData_nascimento DATE ,
     IN pGenero CHAR(1) ,
     IN pTelefone CHAR(13) ,
     IN pEmail VARCHAR(100) ,
     IN pAgencia_ID INT
     )
     BEGIN
		INSERT INTO Cliente (Nome, Contribuinte, Data_nascimento, Genero, Telefone, Email, Agencia_ID) 
        VALUES (pNome, pContribuinte, pData_nascimento, pGenero, pTelefone, pEmail, pAgencia_ID);
	 END$$
	
DELIMITER ;
