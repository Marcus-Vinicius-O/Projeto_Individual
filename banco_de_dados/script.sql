CREATE DATABASE the_last_of_us;
USE the_last_of_us;
show tables;
select * from Usuario;
select * from Resposta;
select * from TentativaQuiz;



CREATE TABLE Usuario (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Personagem (
    personagem_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(500),
    url_imagem VARCHAR(255)
);
CREATE TABLE Pergunta (
    pergunta_id INT AUTO_INCREMENT PRIMARY KEY,
    texto_pergunta VARCHAR(255) NOT NULL
);
CREATE TABLE Alternativa (
    alternativa_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_pergunta INT NOT NULL,
    texto_alternativa VARCHAR(255) NOT NULL,
    fk_personagem INT NOT NULL,
    FOREIGN KEY (fk_pergunta) REFERENCES Pergunta(pergunta_id),
    FOREIGN KEY (fk_personagem) REFERENCES Personagem(personagem_id)
);
CREATE TABLE TentativaQuiz (
    tentativa_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_usuario INT NOT NULL,
    fk_personagem_resultado INT,
    data_tentativa TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (fk_personagem_resultado) REFERENCES Personagem(personagem_id)
);
CREATE TABLE Resposta (
    fk_tentativa INT NOT NULL,
    fk_pergunta INT NOT NULL,
    fk_alternativa INT NOT NULL,
    PRIMARY KEY (fk_tentativa, fk_pergunta),
    FOREIGN KEY (fk_tentativa) REFERENCES TentativaQuiz(tentativa_id),
    FOREIGN KEY (fk_pergunta) REFERENCES Pergunta(pergunta_id),
    FOREIGN KEY (fk_alternativa) REFERENCES Alternativa(alternativa_id)
);
select * from TentativaQuiz;
INSERT INTO TentativaQuiz (fk_usuario, fk_personagem_resultado) VALUES (1, 1);
SELECT * FROM TentativaQuiz;
SELECT 
    t.tentativa_id,
    t.data_tentativa,
    p.nome AS personagem,
    p.descricao,
    p.url_imagem
FROM TentativaQuiz as t
JOIN Personagem as p ON p.personagem_id = t.fk_personagem_resultado
WHERE t.fk_usuario = 1
ORDER BY t.data_tentativa DESC
LIMIT 1;
select * from Personagem;
select * from TentativaQuiz;


-- Personagens
INSERT INTO Personagem (nome, descricao, url_imagem) VALUES
('Joel', 'Um sobrevivente endurecido pelo fim do mundo. Age pela sobrevivência e pela proteção de quem ama, mesmo que isso custe caro.', 'css/imagens/Part_I_Joel_infobox.webp'),
('Ellie', 'Cresceu num mundo sem esperança, mas nunca perdeu a vontade de lutar. Curiosa, corajosa e movida pela vontade de fazer diferença.', 'css/imagens/Part_I_Ellie_infobox.webp'),
('Tess', 'Pragmática e calculista. Faz o que precisa ser feito, sem hesitar. Suas escolhas são guiadas pela razão, não pela emoção.', 'css/imagens/Part_I_Tess_infobox.webp'),
('Tommy', 'Leal e idealista. Acredita que ainda é possível reconstruir algo no caos. Une as pessoas e age pelo bem coletivo.', 'css/imagens/Part_I_Tommy_infobox.webp'),
('Bill', 'Isolado e autossuficiente. Desconfia de todo mundo, mas é extremamente competente. Sobrevive por conta própria e nos seus próprios termos.', 'css/imagens/Part_I_Bill_infobox.webp');
-- Perguntas
INSERT INTO Pergunta (texto_pergunta) VALUES
('Diante de um perigo iminente, qual é sua primeira reação?'),
('Como você lida com pessoas em quem não confia?'),
('O que você faria para sobreviver num mundo pós-apocalíptico?'),
('Qual é o seu maior medo?'),
('Como você toma decisões difíceis?'),
('O que você mais valoriza em outra pessoa?'),
('Qual seria seu papel num grupo de sobreviventes?'),
('Como você lida com a perda de alguém importante?'),
('Qual habilidade você desenvolveria primeiro num apocalipse?'),
('O que você acha de confiar em estranhos?'),
('Diante de uma missão impossível, você:'),
('Qual seria o seu refúgio ideal no fim do mundo?'),
('O que te faria trair um aliado?'),
('Como você enxerga o futuro da humanidade?'),
('O que define quem você é?');

-- Alternativas (fk_pergunta referencia a ordem dos INSERTs acima)
-- Pergunta 1
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(1, 'Avalio a ameaça fria e racionalmente antes de agir.', 3),
(1, 'Protejo quem está do meu lado, custe o que custar.', 1),
(1, 'Enfrento de cabeça, na base do improviso.', 2),
(1, 'Busco uma saída que salve o maior número de pessoas.', 4),
(1, 'Me isolo e neutralizo a ameaça sozinho.', 5);

-- Pergunta 2
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(2, 'Mantenho distância. Confiança se conquista lentamente.', 1),
(2, 'Dou uma chance, mas fico de olho.', 2),
(2, 'As uso enquanto for útil e descarto quando necessário.', 3),
(2, 'Tento entender o lado delas antes de julgá-las.', 4),
(2, 'Prefiro não ter nada a ver com elas.', 5);

-- Pergunta 3
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(3, 'Faria contrabando e negociaria recursos com outros grupos.', 3),
(3, 'Construiria uma comunidade forte e organizada.', 4),
(3, 'Criaria um território próprio cheio de armadilhas.', 5),
(3, 'Me adaptaria ao ambiente usando criatividade.', 2),
(3, 'Faria qualquer coisa para proteger quem eu amo.', 1);

-- Pergunta 4
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(4, 'Perder alguém que amo.', 1),
(4, 'Não conseguir fazer a diferença no mundo.', 2),
(4, 'Não cumprir o que prometi antes de morrer.', 3),
(4, 'Ver minha comunidade desmoronar.', 4),
(4, 'Depender de outras pessoas para sobreviver.', 5);

-- Pergunta 5
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(5, 'Escolho o que protege quem está perto de mim.', 1),
(5, 'Sigo meu instinto mesmo que pareça loucura.', 2),
(5, 'Calculo os riscos e escolho o mais vantajoso.', 3),
(5, 'Penso no impacto coletivo antes de decidir.', 4),
(5, 'Decido sozinho, sem precisar de opinião alheia.', 5);

-- Pergunta 6
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(6, 'Lealdade incondicional.', 1),
(6, 'Honestidade, mesmo que doa.', 2),
(6, 'Competência e pragmatismo.', 3),
(6, 'Vontade de construir algo junto.', 4),
(6, 'Respeitar o meu espaço e meus limites.', 5);

-- Pergunta 7
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(7, 'Líder silencioso que mantém todos vivos.', 1),
(7, 'Curinga que resolve o que ninguém mais consegue.', 2),
(7, 'Estrategista que organiza recursos e rotas.', 3),
(7, 'Que une o grupo e mantém o moral lá em cima.', 4),
(7, 'Especialista que trabalha melhor sozinho.', 5);

-- Pergunta 8
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(8, 'Fecho meu coração e continuo em frente.', 1),
(8, 'Fico com raiva e uso isso como combustível.', 2),
(8, 'Canalizo a dor para cumprir a missão que ficou pendente.', 3),
(8, 'Choro, processo e tento seguir em frente com apoio.', 4),
(8, 'Me isolo ainda mais e processo sozinho.', 5);

-- Pergunta 9
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(9, 'Combate físico e uso de armas.', 1),
(9, 'Furtividade e improvisação com poucos recursos.', 2),
(9, 'Negociação e leitura de pessoas.', 3),
(9, 'Liderança e organização de grupos.', 4),
(9, 'Construção de armadilhas e defesa de território.', 5);

-- Pergunta 10
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(10, 'É um luxo que não posso me dar.', 1),
(10, 'Arriscado, mas às vezes necessário.', 2),
(10, 'Só confio quando tem algo a ganhar.', 3),
(10, 'Todo mundo merece uma chance.', 4),
(10, 'Estranhos são ameaças até prova em contrário.', 5);

-- Pergunta 11
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(11, 'Aceita se houver algo importante em jogo.', 1),
(11, 'Aceita na hora, sem pensar muito.', 2),
(11, 'Analisa se vale o risco antes de comprometer.', 3),
(11, 'Tenta montar um plano coletivo para aumentar as chances.', 4),
(11, 'Prefere não se envolver, não é seu problema.', 5);

-- Pergunta 12
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(12, 'Um lugar longe do caos, só eu e quem eu protejo.', 1),
(12, 'Em movimento, explorando o que sobrou do mundo.', 2),
(12, 'Uma base estratégica bem localizada.', 3),
(12, 'Uma comunidade organizada com regras e propósito.', 4),
(12, 'Uma propriedade isolada, autossuficiente e armada.', 5);

-- Pergunta 13
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(13, 'Se ele ameaçasse alguém que amo.', 1),
(13, 'Se ele fizesse algo que eu considero injusto demais.', 2),
(13, 'Se o custo de continuar leal fosse alto demais.', 3),
(13, 'Dificilmente trairia. Lealdade é tudo pra mim.', 4),
(13, 'Se ele invadir meu território ou quebrar um acordo.', 5);

-- Pergunta 14
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(14, 'Não penso nisso. Só importa o dia de hoje.', 1),
(14, 'Ainda acredito que dá pra mudar tudo.', 2),
(14, 'Realista. As coisas são como são.', 3),
(14, 'Com trabalho coletivo ainda é possível reconstruir.', 4),
(14, 'Cada um que cuide do seu.', 5);

-- Pergunta 15
INSERT INTO Alternativa (fk_pergunta, texto_alternativa, fk_personagem) VALUES
(15, 'As pessoas que escolhi proteger.', 1),
(15, 'Minha vontade de viver e de lutar.', 2),
(15, 'Minhas escolhas, mesmo as mais duras.', 3),
(15, 'Meu compromisso com quem está ao meu redor.', 4),
(15, 'Minha independência e minha capacidade de sobreviver.', 5);

		-- Criando view para realizar as estatísticas dos personagens.
		create view Estatisticas_personagens as SELECT 
            p.nome AS personagem,
            p.url_imagem,
            COUNT(t.fk_personagem_resultado) AS total
        FROM Personagem p
        LEFT JOIN TentativaQuiz t ON t.fk_personagem_resultado = p.personagem_id
        GROUP BY p.personagem_id, p.nome, p.url_imagem
        ORDER BY total DESC;
        
        -- Criando view para buscar o resultado
        create view Resultado_usuario as SELECT 
            p.nome AS personagem,
            p.descricao,
            p.url_imagem
        FROM TentativaQuiz as t
        JOIN Personagem as p ON p.personagem_id = t.fk_personagem_resultado
        WHERE t.fk_usuario = fk_usuario
        ORDER BY t.data_tentativa DESC
        LIMIT 1;
        