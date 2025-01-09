USE Fenix;

DELIMITER //
CREATE FUNCTION CalculaRatio(nCasosResolvidos INT, nCasosAtribuidos INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE Ratio FLOAT;
    SET Ratio = (nCasosResolvidos  / nCasosAtribuidos) * 100;
    RETURN (Ratio);
END //
DELIMITER ;