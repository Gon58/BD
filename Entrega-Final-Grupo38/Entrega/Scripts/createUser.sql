CREATE USER 'joaosa'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON *.* TO 'joaosa24'@'localhost';

CREATE USER 'joaocunha'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON *.* TO 'joaocunha'@'localhost';

CREATE USER 'goncalo'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON *.* TO 'goncalo'@'localhost';

CREATE USER 'diogo'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON *.* TO 'diogo'@'localhost';

CREATE USER 'rodrigo'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON *.* TO 'rodrigo'@'localhost';

CREATE USER 'marianaRibeiro'@'%' IDENTIFIED BY 'chiefFenix';
GRANT SELECT,INSERT,UPDATE,DELETE,FILE, GRANT OPTION ON *.* TO 'marianaRibeiro'@'%';

CREATE USER 'lucasFernandes'@'%' IDENTIFIED BY 'lucasFernandesIntern';
GRANT SELECT ON Fenix.Caso TO 'lucasFernandes'@'%';

FLUSH PRIVILEGES;