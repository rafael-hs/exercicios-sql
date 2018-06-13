###Exer 1###
SELECT ra
FROM historico
WHERE cod_disc='BD'
  AND ano='2015'
  AND nota<5;
###Exer 2###
SELECT aluno.nome,aluno.endereco, aluno.cidade
FROM aluno JOIN historico
	ON aluno.ra = historico.ra
WHERE cod_disc='bd'
	AND ano='2015'
    AND nota<5;
###Exer 3###
SELECT DISTINCT professor.nome
FROM professor JOIN historico
	ON professor.cod_prof = historico.cod_prof
WHERE cod_disc='bd'
AND ano='2015';
###Exer 4###
SELECT aluno.nome,aluno.endereco,aluno.cidade,disciplina.cod_disc
FROM aluno JOIN historico 
	ON aluno.ra = historico.ra
		JOIN disciplina
			ON historico.cod_disc = disciplina.cod_disc
WHERE nota<5
AND ano='2015';
###Exer 5###
SELECT aluno.nome,aluno.ra
FROM aluno JOIN historico
	ON aluno.ra = historico.ra
		JOIN professor
			ON historico.cod_prof = professor.cod_prof
WHERE professor.nome LIKE '%JOSÉ%'
	AND ano='2015';
###Exer 6###
SELECT DISTINCT aluno.nome,aluno.ra
FROM aluno JOIN historico
	ON aluno.ra = historico.ra
		JOIN professor
			ON professor.cod_prof = historico.cod_prof
WHERE professor.nome LIKE '%jose%'
	AND (ano = 2015 OR ano = 2014)
    AND aluno.ra IN(
SELECT DISTINCT aluno.ra
FROM aluno JOIN historico
	ON aluno.ra = historico.ra
		JOIN professor
	ON professor.cod_prof = historico.cod_prof
WHERE professor.nome LIKE '%marcos%');
###Exer 7###
SELECT aluno.ra,aluno.nome,historico.cod_disc,disciplina.nome_disc,historico.frequencia,historico.nota,historico.ano
FROM aluno JOIN historico
	ON aluno.ra = historico.ra
		JOIN disciplina
			ON disciplina.cod_disc = historico.cod_disc
WHERE aluno.nome LIKE '%alex%';

/*
SELECT DISTINCT alex.ra, alex.nome,
		disciplina.cod_disc, disciplina.nome_disc
        frequencia,nota,ano
FROM (SELECT * FROM aluno
	WHERE nome LIKE "%alex%") as alex
			JOIN historico
	ON alex.ra = historico.ra
			JOIN disciplina
	ON disciplina.cod_disc = historico.cod_disc*/

###Exer 8###
SELECT nome,endereco
FROM aluno 
WHERE cidade LIKE '%vitoria%'
UNION
SELECT nome,endereco
FROM professor
WHERE cidade LIKE '%vitoria%';
###Exer 9###
SELECT DISTINCT aluno.nome as aluno,professor.nome as professor,disciplina.nome_disc as disciplina
FROM aluno JOIN historico
	ON aluno.ra = historico.ra
		JOIN professor
			ON professor.cod_prof = historico.cod_prof
				JOIN disciplina
					ON disciplina.cod_disc = historico.cod_disc
WHERE disciplina.carga_hor >60;
###Exer 10###
SELECT professor.nome
FROM professor JOIN historico
	ON professor.cod_prof = historico.cod_prof
		JOIN aluno
			ON aluno.ra = historico.ra
				JOIN disciplina
					ON disciplina.cod_disc = historico.cod_disc
WHERE aluno.nome LIKE 'pedro paulo cunha' 
AND(nota<5 OR frequencia<0.75*carga_hor);

/*otimização
SELECT professor.nome 
FROM professor JOIN historico
	ON professor.cod_prof = historico.cod_prof
		JOIN (SELECT * FROM aluno
			WHERE aluno.nome LIKE "pedro paulo cunha")
	ON aluno.ra = historico.ra
		JOIN disciplina
	ON disciplina.cod_disc = historico.cod_disc
	WHERE (nota < 5 OR frequencia < 0.75*carga_hor)
*/
