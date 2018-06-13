DROP TABLE IF EXISTS `aluno`;
CREATE TABLE `aluno` (
  `ra` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255),
  `cidade` varchar(255),
  PRIMARY KEY (`ra`)
);
DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE `disciplina` (
  `cod_disc` varchar(3) NOT NULL,
  `nome_disc` varchar(255) NOT NULL,
  `carga_hor` int(3) NOT NULL,
  PRIMARY KEY (`cod_disc`)
);
DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `cod_prof` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255),
  `cidade` varchar(255),
  PRIMARY KEY (`cod_prof`)
);
DROP TABLE IF EXISTS `turma`;
CREATE TABLE `turma` (
  `cod_turma` int(11) NOT NULL AUTO_INCREMENT,
  `cod_disc` varchar(3) NOT NULL,
  `cod_prof` int(11) NOT NULL,
  `ano` int(4) NOT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`cod_turma`),
  KEY `turma_professor` (`cod_prof`),
  KEY `turma_disciplina` (`cod_disc`),
  CONSTRAINT `turma_disciplina` FOREIGN KEY (`cod_disc`) REFERENCES `disciplina` (`cod_disc`) ON UPDATE CASCADE,
  CONSTRAINT `turma_professor` FOREIGN KEY (`cod_prof`) REFERENCES `professor` (`cod_prof`) ON UPDATE CASCADE
);
DROP TABLE IF EXISTS `historico`;
CREATE TABLE `historico` (
  `ra` int(11) NOT NULL AUTO_INCREMENT,
  `cod_turma` int(11) NOT NULL,
  `cod_disc` varchar(3) NOT NULL,
  `cod_prof` int(11) NOT NULL,
  `ano` int(4) NOT NULL,
  `frequencia` int(3) NOT NULL,
  `nota` int(11) NOT NULL,
  PRIMARY KEY (`ra`,`cod_turma`,`cod_disc`,`cod_prof`,`ano`),
  KEY `historico_turma` (`cod_turma`),
  KEY `historico_professor` (`cod_prof`),
  KEY `historico_aluno` (`ra`),
  KEY `historico_disciplina` (`cod_disc`),
  CONSTRAINT `historico_aluno` FOREIGN KEY (`ra`) REFERENCES `aluno` (`ra`) ON UPDATE CASCADE,
  CONSTRAINT `historico_disciplina` FOREIGN KEY (`cod_disc`) REFERENCES `disciplina` (`cod_disc`) ON UPDATE CASCADE,
  CONSTRAINT `historico_professor` FOREIGN KEY (`cod_prof`) REFERENCES `professor` (`cod_prof`) ON UPDATE CASCADE,
  CONSTRAINT `historico_turma` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`) ON UPDATE CASCADE
);
