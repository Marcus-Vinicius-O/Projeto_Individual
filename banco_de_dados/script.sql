create database the_last_of_us;
use the_last_of_us;
CREATE TABLE Usuario (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Pergunta (
    pergunta_id INT AUTO_INCREMENT PRIMARY KEY,
    texto_pergunta VARCHAR(255) NOT NULL
);
CREATE TABLE Alternativa (
    alternativa_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_pergunta INT NOT NULL,
    texto_alternativa VARCHAR(255) NOT NULL,
    correta BOOLEAN NOT NULL,
    FOREIGN KEY (fk_pergunta)
        REFERENCES Pergunta(pergunta_id)
);
CREATE TABLE TentativaQuiz (
    tentativa_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_usuario INT NOT NULL,
    pontuacao INT,
    data_tentativa TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario)
        REFERENCES Usuario(usuario_id)
);

CREATE TABLE Resposta (
    fk_tentativa INT NOT NULL,
    fk_pergunta INT NOT NULL,
    fk_alternativa INT NOT NULL,
    PRIMARY KEY (fk_tentativa, fk_pergunta),
    FOREIGN KEY (fk_tentativa)
        REFERENCES TentativaQuiz(tentativa_id),
    FOREIGN KEY (fk_pergunta)
        REFERENCES Pergunta(pergunta_id),
    FOREIGN KEY (fk_alternativa)
        REFERENCES Alternativa(alternativa_id)
);