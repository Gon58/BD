USE Fenix;

CREATE VIEW Clientes AS 
SELECT *
FROM Cliente
ORDER BY Nome ASC;

CREATE VIEW Suspeitos AS 
SELECT *
FROM Suspeito
ORDER BY Nome ASC;

CREATE VIEW Casos AS
SELECT *
FROM Caso
ORDER BY N_Registo ASC;

CREATE VIEW Nrcasos AS
SELECT NR, Nome, nCasosAtribuidos, nCasosResolvidos
FROM Detetive
ORDER BY NR ASC;

CREATE VIEW DetetivesPorRatio AS
SELECT NR, Nome, CalculaRatio(Detetive.nCasosResolvidos, Detetive.nCasosAtribuidos) AS Ratio
FROM Detetive
ORDER BY Ratio DESC;