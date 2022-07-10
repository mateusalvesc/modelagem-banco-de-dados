create database escolaprofissionalizante;
use escolaprofissionalizante;

CREATE TABLE Curso (
    idCurso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(30) NOT NULL,
    descricaoCurso VARCHAR(50) NOT NULL,
    duracaoCurso VARCHAR(10) NOT NULL,
    periodoCurso VARCHAR(10) NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    fk_Disciplina_idDisciplina INT
);

INSERT INTO Curso (nomeCurso, descricaoCurso, duracaoCurso, periodoCurso, dataInicio, dataFim) values 
('MySQL', 'Curso de Banco de Dados com MySQL', '3 meses', 'manhã', '2022-05-02', '2022-07-01');
SELECT * FROM Curso;

DELETE FROM Curso
WHERE idCurso = '1';

CREATE TABLE Aluno (
    idAluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR(50) NOT NULL,
    rgAluno VARCHAR(9) NOT NULL,
    cpfAluno VARCHAR(11) NOT NULL,
    emailAluno VARCHAR(50) NOT NULL,
    telefoneAluno VARCHAR(11) NOT NULL,
    dataNascimentoAluno DATE NOT NULL,
    sexoAluno VARCHAR(15),
    prontuarioAluno TEXT,
    fk_enderecoAluno_enderecoAluno_PK INT
);

INSERT INTO Aluno (nomeAluno, rgAluno, cpfAluno, emailAluno, telefoneAluno, dataNascimentoAluno, sexoAluno, prontuarioAluno) values
('Mateus Alves', '444155569', '39631189806', 'mateus@email.com', '11961773370', '2002-06-09', 'Masculino', 'Sem ocorrências');
SELECT * FROM Aluno;

DELETE FROM Aluno
WHERE idAluno = '1';

CREATE TABLE Disciplina (
    idDisciplina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeDisciplina VARCHAR(30) NOT NULL,
    aulasSemana VARCHAR(25) NOT NULL,
    cargaHorariaDisciplina VARCHAR(10) NOT NULL,
    areaDisciplina VARCHAR(20) NOT NULL,
    semestreDisciplina VARCHAR(10) NOT NULL,
    fk_Turma_idTurma INT
);

INSERT INTO Disciplina (nomeDisciplina, aulasSemana, cargaHorariaDisciplina, areaDisciplina, semestreDisciplina) values
('Banco de Dados', 'Seg, Qua e Sex', '80', 'Back-End', '1º/2022', '1');
SELECT * FROM Disciplina;

DELETE FROM Disciplina
WHERE idDisciplina = '1';

CREATE TABLE Turma (
    idTurma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quantidadeAluno VARCHAR(5),
    idDisciplina INT,
    idProfessor INT,
    fk_Aluno_idAluno INT
);

CREATE TABLE Professor (
    idProfessor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeProfessor VARCHAR(50) NOT NULL,
    disciplinaProfessor VARCHAR(40) NOT NULL,
    rgProfessor VARCHAR(9) NOT NULL,
    cpfProfessor VARCHAR(11) NOT NULL,
    telefoneProfessor VARCHAR(11) NOT NULL,
    emailProfessor VARCHAR(50) NOT NULL,
    dataNascimentoProfessor DATE NOT NULL,
    sexoProfessor VARCHAR(15),
    prontuarioProfessor TEXT,
    fk_enderecoProfessor_enderecoProfessor_PK INT
);

CREATE TABLE Sala (
    idSala INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    blocoSala VARCHAR(10) NOT NULL,
    numeroSala VARCHAR(5) NOT NULL,
    andarSala VARCHAR(2) NOT NULL,
    tipoSala VARCHAR(30) NOT NULL,
    capacidadeSala VARCHAR(5) NOT NULL
);

CREATE TABLE AlunoCurso_Matricular (
    idMatricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    situacao VARCHAR(20) NOT NULL,
    dataMatricula DATE NOT NULL,
    fk_Curso_idCurso INT,
    fk_Aluno_idAluno INT
);

CREATE TABLE AlunoDisciplina_Matricular (
    idAlunoDisciplina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricaoAluno VARCHAR(50) NOT NULL,
    descricaoDisciplina VARCHAR(50) NOT NULL,
    fk_Aluno_idAluno INT,
    fk_Disciplina_idDisciplina INT
);

CREATE TABLE ProfessorTurma_Lecionar (
    idProfessorTurma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricaoProfessor VARCHAR(50) NOT NULL,
    descricaoTurma VARCHAR(50) NOT NULL,
    fk_Turma_idTurma INT,
    fk_Professor_idProfessor INT
);

CREATE TABLE SalaTurma_Utilizar (
    idSalaTurma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricaoSala VARCHAR(50) NOT NULL,
    fk_Turma_idTurma INT,
    fk_Sala_idSala INT
);

CREATE TABLE DisciplinaProfessor_Ministrar (
    idDisciplinaProfessor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_Disciplina_idDisciplina INT,
    fk_Professor_idProfessor INT
);

CREATE TABLE enderecoAluno (
    enderecoAluno_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(40) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    bairro VARCHAR(25) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE enderecoProfessor (
    enderecoProfessor_PK INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(40) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    complemento VARCHAR(15) NOT NULL,
    bairro VARCHAR(25) NOT NULL,
    cep VARCHAR(8) NOT NULL
);
 
ALTER TABLE Curso ADD CONSTRAINT FK_Curso_2
    FOREIGN KEY (fk_Disciplina_idDisciplina)
    REFERENCES Disciplina (idDisciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_enderecoAluno_enderecoAluno_PK)
    REFERENCES enderecoAluno (enderecoAluno_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_Turma_idTurma)
    REFERENCES Turma (idTurma)
    ON DELETE RESTRICT;
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_2
    FOREIGN KEY (fk_Aluno_idAluno)
    REFERENCES Aluno (idAluno)
    ON DELETE RESTRICT;
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_enderecoProfessor_enderecoProfessor_PK)
    REFERENCES enderecoProfessor (enderecoProfessor_PK)
    ON DELETE SET NULL;
 
ALTER TABLE AlunoCurso_Matricular ADD CONSTRAINT FK_AlunoCurso_Matricular_2
    FOREIGN KEY (fk_Curso_idCurso)
    REFERENCES Curso (idCurso);
 
ALTER TABLE AlunoCurso_Matricular ADD CONSTRAINT FK_AlunoCurso_Matricular_3
    FOREIGN KEY (fk_Aluno_idAluno)
    REFERENCES Aluno (idAluno);
 
ALTER TABLE AlunoDisciplina_Matricular ADD CONSTRAINT FK_AlunoDisciplina_Matricular_2
    FOREIGN KEY (fk_Aluno_idAluno)
    REFERENCES Aluno (idAluno);
 
ALTER TABLE AlunoDisciplina_Matricular ADD CONSTRAINT FK_AlunoDisciplina_Matricular_3
    FOREIGN KEY (fk_Disciplina_idDisciplina)
    REFERENCES Disciplina (idDisciplina);
 
ALTER TABLE ProfessorTurma_Lecionar ADD CONSTRAINT FK_ProfessorTurma_Lecionar_2
    FOREIGN KEY (fk_Turma_idTurma)
    REFERENCES Turma (idTurma);
 
ALTER TABLE ProfessorTurma_Lecionar ADD CONSTRAINT FK_ProfessorTurma_Lecionar_3
    FOREIGN KEY (fk_Professor_idProfessor)
    REFERENCES Professor (idProfessor);
 
ALTER TABLE SalaTurma_Utilizar ADD CONSTRAINT FK_SalaTurma_Utilizar_2
    FOREIGN KEY (fk_Turma_idTurma)
    REFERENCES Turma (idTurma);
 
ALTER TABLE SalaTurma_Utilizar ADD CONSTRAINT FK_SalaTurma_Utilizar_3
    FOREIGN KEY (fk_Sala_idSala)
    REFERENCES Sala (idSala);
 
ALTER TABLE DisciplinaProfessor_Ministrar ADD CONSTRAINT FK_DisciplinaProfessor_Ministrar_2
    FOREIGN KEY (fk_Disciplina_idDisciplina)
    REFERENCES Disciplina (idDisciplina);
 
ALTER TABLE DisciplinaProfessor_Ministrar ADD CONSTRAINT FK_DisciplinaProfessor_Ministrar_3
    FOREIGN KEY (fk_Professor_idProfessor)
    REFERENCES Professor (idProfessor);