INSERT INTO `aluno` (`ra`,`nome`,`endereco`,`cidade`) 
VALUES (1,'Bruno Costa','Vix - Escroto do siri','Vitória'),
       (2,'Rafaela Silva','Buraco do tatu','Serra'),
       (3,'José da Silva','Vix - Asa da cigarra','Vitória'),
       (4,'Alex Andre','Biblioteca','Cariacica'),
       (5,'Pedro Paulo Cunha','Espuma do sabão','Serra'),
       (6,'Astrogildo Kana','Gomo','Serra'),
       (5400001,'Hilária Riso','Vix - Algodão doce','Vitória'),
       (20090121,'Xahadalaia Brakah','Verruga da ostra','Cariacica');

INSERT INTO `professor` (`cod_prof`,`nome`,`endereco`,`cidade`) 
VALUES (1,'José de Alencar','Vix - Acá mesmo','Vitória'),
       (2,'Marcos Dubal','Vix - Seilá onde','Vitória'),
       (3,'João de Alameda','Alameda','Serra');

INSERT INTO `disciplina` (`cod_disc`,`nome_disc`,`carga_hor`) 
VALUES ('ANL','Análise de Sistemas',40),
       ('BD','Banco de Dados',80),
       ('POO','Programação Orientada a Objetos',120),
       ('PRJ','Projeto de Sistemas',40);

INSERT INTO `turma` (`cod_turma`,`cod_disc`,`cod_prof`,`ano`,`horario`) 
VALUES (1,'BD',1,2015,'18:40:00'),
       (2,'POO',2,2015,'20:40:00'),
       (3,'BD',1,2014,'20:40:00'),
       (4,'PRJ',3,2015,'18:40:00'),
       (5,'ANL',3,2015,'20:40:00');

INSERT INTO `historico` (`ra`,`cod_turma`,`cod_disc`,`cod_prof`,`ano`,`frequencia`,`nota`) 
VALUES (1,1,'BD',1,2015,74,7),
       (1,2,'POO',2,2015,102,9),
       (1,4,'PRJ',3,2015,38,3),
       (2,1,'BD',1,2015,56,2),
       (2,5,'ANL',3,2015,34,2),
       (3,1,'BD',1,2015,76,8),
       (3,2,'POO',2,2015,110,7),
       (3,3,'BD',1,2014,68,3),
       (3,4,'PRJ',3,2015,34,7),
       (3,5,'ANL',3,2015,36,8),
       (4,1,'BD',1,2015,44,2),
       (4,2,'POO',2,2015,108,8),
       (5,2,'POO',2,2015,32,0),
       (5,3,'BD',1,2014,52,3),
       (6,3,'BD',1,2014,70,6),
       (5400001,2,'POO',2,2015,66,9),
       (5400001,5,'ANL',3,2015,38,8),
       (20090121,3,'BD',1,2014,80,6),
       (20090121,4,'PRJ',3,2015,36,3);
