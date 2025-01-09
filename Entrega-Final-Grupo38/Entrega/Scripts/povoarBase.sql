USE Fenix;

INSERT INTO Agencia (Nr_Detetives, Rua, CodPostal, Porta, Email, Polo) VALUES
    (10,'Rua do Alpinista', '4730-302', '13','p1.fenix@fenix.pt','P1'),
     (10,'Rua Alto do Monte Largo', '4750-32', '56','p2.fenix@fenix.pt','P2'),
      (10,'Rua da Universidade', '4780-12', '43','p3.fenix@fenix.pt','P3');

INSERT INTO Telefone(Telefone_ID,Agencia) VALUES 
('+351912245234',1), 
('+351912345234',2), 
('+351912342344',3);

 INSERT INTO Cliente (Nome, Contribuinte, Data_nascimento,Telefone ,Genero, Email, Agencia_ID) VALUES 

    ('João Cunha', 123456789, "2004-06-11",'+351987654321', "M", "joaoCunha@gmail.com",1),
    ('Gonçalo Silva', 123456789, "2004-06-11",'+351987623456', "M", "goncalosilva@gmail.com",1),
    ('Diogo Esteves', 123456789, "2004-10-11",'+351923456781', "M", "diogoesteves@gmail.com",2),
    ('Rodrigo Granja', 123456789, "2004-06-11",'+351912345677', "M", "rodrigogranja@gmail.com",2),
    ('João Sá', 212132456, "2004-06-11",'+351912653433', "M", "joaosa@gmail.com",3);


INSERT INTO Area (Area) VALUES 
    ('Fraude'),
    ('Crime Organizado'),
    ('Furto'),
    ('Terrorismo'),
    ('CiberTerrorismo'),
    ('Vandalismo'),
    ('Roubo'),
    ('Homicidios'),
    ('Agressão'),
    ('CiberCrime');

INSERT INTO Case_status (Status) VALUES
    ('aberto'),
    ('fechado'),
    ('arquivado');

INSERT INTO Caso  (Descricao, Case_Status, Data_abertura,Data_fecho ,Cliente_ID, Area_ID) VALUES
    ('Ameaça de bomba na baixa de Lisboa',2,"2022-10-11","2022-10-15",3,4);

INSERT INTO Caso (Descricao, Case_Status, Data_abertura, Cliente_ID, Area_ID) VALUES
    ('Corpo encontrado no lixo',1,"2024-05-28",1,8),
    ('Roubo de um banco online',1,"2023-12-20",2,10),
    ('Roubo de veiculo encontrado no Porto',3,"2024-04-30",4,7);

INSERT INTO Evidencias (Evidencias, Caso_Nr_Registo)
VALUES 
    ('Relatório fotográfico detalhado dos danos na cena do crime, incluindo registros de cada área afetada, diferentes ângulos e legendas descritivas em cada imagem, fornecendo uma visão abrangente da extensão dos danos e possíveis pistas.',1),
    ('Vídeo de vigilância capturado em vários pontos de um posto de gasolina próximo, cobrindo não apenas a área imediata, mas também os arredores, com imagens de alta resolução e carimbos de data/hora para uma análise temporal precisa.',2),
    ('Depoimentos detalhados de testemunhas oculares, incluindo não apenas o relato do incidente em si, mas também observações sobre o comportamento dos envolvidos, quaisquer palavras-chave ou frases que foram trocadas e quaisquer gestos ou expressões faciais significativas.',3),
    ('Análise detalhada das impressões digitais encontradas na arma do crime, incluindo não só a identificação das impressões, mas também a determinação da idade aproximada das impressões e quaisquer fatores ambientais que possam afetar a sua integridade.',4),
    ('Registos telefónicos pormenorizados, mostrando uma cronologia completa das comunicações entre suspeitos, incluindo chamadas, mensagens de texto e dados de localização, com uma análise dos padrões de comunicação e possíveis ligações a eventos relevantes.',1),
    ('Análise completa do ADN que corresponda ao principal suspeito, incluindo perfis genéticos, comparações com bases de dados de ADN criminais e uma avaliação estatística da probabilidade de correspondência.',2),
    ('Cópias autenticadas de e-mails trocados entre as partes envolvidas, incluindo metadados completos, análise de cabeçalho e qualquer conteúdo oculto ou criptografado, fornecendo uma visão completa das comunicações eletrônicas.',3),
    ('Extrato bancário detalhado que revela transações suspeitas, incluindo datas, valores, locais e partes envolvidas, com análise financeira para identificar padrões de comportamento e potenciais motivações.',4),
    ('Gravação de áudio de uma conversa incriminadora, capturando não apenas as palavras faladas, mas também nuances de tom de voz, entonação e outras pistas não verbais que podem fornecer informações adicionais sobre o contexto e a intenção.',1),
    ('Cópias autenticadas de documentos financeiros falsificados encontrados no domicílio do suspeito, com uma análise forense exaustiva, incluindo testes de autenticidade, comparações com documentos legítimos e identificação das técnicas de falsificação utilizadas.',2);

INSERT INTO Patente (Designacao) VALUES 
    ('Estagiário'), 
    ('Investigador'), 
    ('Sênior'), 
    ('Chefe');

INSERT INTO Detetive (Nome, Salario, Especializacao, nCasosResolvidos, nCasosAtribuidos, Agencia_ID, Patente_ID)
VALUES 
-- Séniores
('Carlos Pereira', 7000, 1, 50, 55, 1, 3),  
('Ana Costa', 7200, 2, 48, 53, 1, 3),  
('Fernando Rocha', 7100, 5, 52, 57, 1, 3),  
-- Chefe
('Mariana Ribeiro', 10000, 4, 100, 100, 2, 4);


INSERT INTO Detetive (Nome, Salario, Especializacao, nCasosResolvidos, nCasosAtribuidos, Agencia_ID, Patente_ID, Supervisor_ID)
VALUES 
('João Silva', 3000, 10, 5, 10, 1, 1, 1),  
('Lucas Fernandes', 3200, 3, 3, 6, 1, 1, 2),  
('Gabriela Alves', 3100, 6, 4, 8, 3, 1, 3),  
('Maria Souza', 5000, 8, 20, 25, 2, 1, 4),  
('Carlos Mota', 5200, 7, 18, 23, 3, 2, 3),  
('Juliana Lima', 5100, 9, 22, 27, 2, 2, 4);


INSERT INTO TelefoneDetetive (Telefone,NR_detetive) VALUES 
('+351912345678',1), 
('+351912345679',2), 
('+351912345680',3), 
('+351912345681',4), 
('+351912345682',5), 
('+351912345683',6), 
('+351912345684',7), 
('+351912345685',8), 
('+351912345686',9), 
('+351912345687',10);

INSERT INTO Tem (Caso_Nr_Registo,Agencia_ID) VALUES
    (1,2),
    (2,3),
    (4,1),
    (3,1);


INSERT INTO Investiga (Detetive_Nr,Caso_Nr_Registo) VALUES
    (1,3),
    (2,3),
    (5,4),
    (6,2),
    (2,4),
    (5,1),
    (10,1),
    (8,2),
    (1,4);

INSERT INTO Suspeito (Nome, Historico, Descricao, Rua, Codigo_Postal, Porta) VALUES 
    ('Roberto Carlos','Sem antepaçados criminais','Negro, alto' ,'Rua dos chãos', '4700-234','12'),
    ('Carlos Roberto','Sem antepaçados criminais','Moreno, baixo', 'Rua dos chãos', '4700-234','12'),
    ('João Carvalho','Roubo à mão armada','Baixa estatura. Cabelo loiro' ,'Rua Fonte do mundo', '4700-233','10'),
    ('Gonçalo Reis','Sem antepaçados criminais','Estatura alta, de porte forte' ,'Praça da Républica', '4700-233','2');


INSERT INTO Tem_associados (Caso_Nr_Registo, Suspeito_ID) VALUES 
    (1,2),
    (2,3),
    (3,4),
    (4,1);
