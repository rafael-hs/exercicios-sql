#1
SELECT ra
  FROM historico
 WHERE cod_disc='BD'
   AND ano=2015
   AND nota<5;
#2
SELECT aluno.ra, nome, nota
  FROM aluno JOIN historico 
             ON aluno.ra=historico.ra
 WHERE cod_disc='BD'
   AND ano=2015
   AND nota<5;
#3
SELECT DISTINCT(nome)
  FROM professor JOIN turma 
                 ON professor.cod_prof=turma.cod_prof
 WHERE ano=2015
   AND cod_disc='BD';
#4
SELECT nome, endereco, cidade, cod_disc
  FROM aluno JOIN historico 
             ON aluno.ra=historico.ra
 WHERE ano=2015
   AND nota<5;
#5
SELECT DISTINCT(aluno.ra), aluno.nome
  FROM professor JOIN (aluno JOIN historico 
                             ON aluno.ra=historico.ra) 
                 ON professor.cod_prof=historico.cod_prof
 WHERE professor.nome LIKE '%JOSÉ%'
   AND ano=2015;
#6
SELECT DISTINCT(aluno.ra), aluno.nome
  FROM professor JOIN (aluno JOIN historico 
                             ON aluno.ra=historico.ra) 
                 ON professor.cod_prof=historico.cod_prof
 WHERE professor.nome LIKE '%JOSÉ%'
   AND (ano=2015 OR ano=2014)
   AND aluno.ra IN (SELECT ra
                      FROM professor JOIN historico ON professor.cod_prof=historico.cod_prof
                     WHERE nome LIKE '%MARCOS%');
#7
SELECT alex.ra, nome, historico.cod_disc, nome_disc, ano, frequencia, nota
  FROM disciplina JOIN ((SELECT ra, nome 
                           FROM aluno 
                          WHERE nome LIKE '%ALEX%') as alex JOIN historico 
                                                            ON alex.ra=historico.ra) 
                  ON disciplina.cod_disc=historico.cod_disc;
#8
SELECT nome, endereco
  FROM aluno
 WHERE cidade='VITÓRIA'
 UNION
SELECT DISTINCT(nome), endereco
  FROM professor
 WHERE cidade='VITÓRIA';
#9
SELECT distinct(aluno.nome) as aluno, professor.nome as professor
  FROM professor JOIN (disciplina JOIN (aluno JOIN historico 
                                              ON aluno.ra=historico.ra) 
                                  ON disciplina.cod_disc=historico.cod_disc) 
                 ON professor.cod_prof=historico.cod_prof
 WHERE carga_hor>=60;
#10
SELECT DISTINCT(professor.nome)
  FROM professor JOIN (disciplina JOIN (aluno JOIN historico 
                                              ON aluno.ra=historico.ra) 
                                  ON disciplina.cod_disc=historico.cod_disc) 
                 ON professor.cod_prof=historico.cod_prof
 WHERE aluno.nome='PEDRO PAULO CUNHA'
   AND (nota<5 OR frequencia<(0.75*carga_hor));
#11
SELECT aluno.ra, nome, AVG(nota)
  FROM aluno JOIN historico 
             ON aluno.ra=historico.ra
 GROUP BY aluno.ra;
#12
SELECT DISTINCT(ra), nome
  FROM aluno
 WHERE NOT EXISTS (SELECT cod_disc
                     FROM professor JOIN turma 
                                    ON professor.cod_prof=turma.cod_prof
                    WHERE nome LIKE '%JOÃO%'
                      AND cod_disc NOT IN (SELECT cod_disc
                                             FROM historico
                                            WHERE aluno.ra=historico.ra));
#13
SELECT aluno.ra, nome, AVG(nota)
  FROM aluno JOIN historico 
             ON aluno.ra=historico.ra
 WHERE NOT EXISTS (SELECT cod_disc
                     FROM professor JOIN turma 
                                    ON professor.cod_prof=turma.cod_prof
                    WHERE cidade='VITÓRIA'
                      AND cod_disc NOT IN (SELECT cod_disc
                                             FROM historico
                                            WHERE aluno.ra=historico.ra))
 GROUP BY aluno.ra;
#14
SELECT DISTINCT(aluno.ra), nome
  FROM aluno JOIN historico 
             ON aluno.ra=historico.ra
 WHERE nota<any (SELECT nota
                   FROM historico
                  WHERE ra=20090121)
   AND aluno.ra<>20090121;
#15
SELECT nome
  FROM aluno
 WHERE ra NOT IN (SELECT DISTINCT(ra)
                    FROM historico
                   WHERE ano=2015);
#16
SELECT nome
  FROM professor
 WHERE cod_prof NOT IN (SELECT turma.cod_prof
                          FROM disciplina JOIN turma
                                          ON disciplina.cod_disc=turma.cod_disc
                         WHERE carga_hor>=60);
#17
SELECT nome
  FROM aluno
 WHERE ra NOT IN (SELECT ra
                    FROM disciplina JOIN historico
                                    ON disciplina.cod_disc=historico.cod_disc
                   WHERE nota<5 OR frequencia<(0.75*carga_hor));
#18
SELECT nome, nota
  FROM aluno JOIN historico 
             ON aluno.ra=historico.ra
 WHERE cod_disc='BD'
   AND ano=2015
   AND nota<all (SELECT AVG(nota)
                   FROM historico
                  WHERE cod_disc='BD'
                    AND ano=2015);
#19
SELECT disciplina.cod_disc, nome_disc, AVG(nota) 
  FROM disciplina JOIN historico 
                  ON disciplina.cod_disc=historico.cod_disc
 GROUP BY disciplina.cod_disc
HAVING AVG(nota)>5;
#20
SELECT COUNT(ra)
  FROM historico
 WHERE cod_disc='BD'
   AND ano=2015;
#21
SELECT nome_disc, AVG(nota)
  FROM disciplina JOIN historico 
                  ON disciplina.cod_disc=historico.cod_disc
 GROUP BY nome_disc
HAVING AVG(nota)>=all (SELECT AVG(nota)
                         FROM historico
                        GROUP BY cod_disc);
#22
SELECT cod_disc, AVG(nota)
  FROM historico
 GROUP BY cod_disc
HAVING AVG(nota)<all (SELECT AVG(nota)
                        FROM historico
                       WHERE cod_disc='BD');
#23
SELECT nome
  FROM professor JOIN historico
                 ON professor.cod_prof=historico.cod_prof
 WHERE ra=5400001;
#24
SELECT nome_disc
  FROM disciplina JOIN historico 
                  ON disciplina.cod_disc=historico.cod_disc
 GROUP BY nome_disc, carga_hor
HAVING AVG(frequencia)<(0.75*carga_hor);
#25
SELECT nome, COUNT(nome)
  FROM disciplina JOIN (aluno JOIN historico 
                              ON aluno.ra=historico.ra)
                  ON disciplina.cod_disc=historico.cod_disc
 WHERE ano=2015
   AND (nota<5 OR frequencia<(0.75*carga_hor))
 GROUP BY nome
HAVING COUNT(nome)>=2;
#26
SELECT COUNT(historico.ra)
  FROM disciplina JOIN (aluno JOIN historico 
                              ON aluno.ra=historico.ra)
                  ON disciplina.cod_disc=historico.cod_disc
 WHERE nome='JOSÉ DA SILVA'
   AND nome_disc='BANCO DE DADOS';
#27
SELECT COUNT(historico.ra)
  FROM historico JOIN disciplina 
                 ON disciplina.cod_disc=historico.cod_disc
 WHERE nome_disc='BANCO DE DADOS'
   AND (ano=2014 or ano=2015);
#28
SELECT nome, ano, COUNT(disciplina.cod_disc)
  FROM disciplina JOIN (aluno JOIN historico 
                              ON aluno.ra=historico.ra)
                  ON disciplina.cod_disc=historico.cod_disc
 WHERE nota<5 OR frequencia<(0.75*carga_hor)
 GROUP BY nome, ano
HAVING COUNT(disciplina.cod_disc)>=2;
#29
SELECT nome, nome_disc, COUNT(historico.ra)
  FROM professor JOIN (disciplina JOIN historico 
                                  ON disciplina.cod_disc=historico.cod_disc) 
                 ON professor.cod_prof=historico.cod_prof
 WHERE (nota<5 OR frequencia<(0.75*carga_hor))
   AND ano=2015
 GROUP BY nome, nome_disc
HAVING COUNT(historico.ra)<2;
#30
SELECT nome, cod_disc, AVG(nota)
  FROM professor JOIN historico 
                 ON professor.cod_prof=historico.cod_prof
 WHERE ano=2015
GROUP BY nome, cod_disc;
