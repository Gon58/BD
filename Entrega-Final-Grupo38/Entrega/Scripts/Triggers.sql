Use Fenix;

DELIMITER $$

CREATE TRIGGER AtualizaNrDetetives
AFTER INSERT ON Detetive
FOR EACH ROW
BEGIN
    UPDATE Agencia 
    SET Nr_Detetives = Nr_Detetives + 1
    WHERE Agencia.ID = NEW.Agencia_ID;
END $$

CREATE TRIGGER AtualizaNrCasos AFTER UPDATE ON Caso
FOR EACH ROW
BEGIN
    IF NEW.Case_Status = 2 THEN
        UPDATE Detetive
        SET nCasosResolvidos = nCasosResolvidos + 1
        WHERE NR IN (
            SELECT Detetive_Nr 
            FROM Investiga 
            WHERE Caso_Nr_Registo = NEW.N_Registo
        );
    END IF;
END$$


CREATE TRIGGER AtualizaNrCasosAtribuidos AFTER INSERT ON Investiga
FOR EACH ROW
BEGIN
        UPDATE Detetive
        SET nCasosAtribuidos = nCasosAtribuidos + 1
        WHERE NR IN (
            SELECT Detetive_Nr 
            FROM Investiga 
        );
END$$
Delimiter ;
