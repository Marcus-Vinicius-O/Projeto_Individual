const database = require('../database/config');

function listarPerguntas() {
    var instrucaoSql = `
        SELECT 
            p.pergunta_id,
            p.texto_pergunta,
            a.alternativa_id,
            a.texto_alternativa,
            a.fk_personagem
        FROM Pergunta p
        JOIN Alternativa a ON a.fk_pergunta = p.pergunta_id
        ORDER BY p.pergunta_id, a.alternativa_id;
    `;
    return database.executar(instrucaoSql);
}

function salvarTentativa(fk_usuario, fk_personagem_resultado) {
    var instrucaoSql = `
        INSERT INTO TentativaQuiz (fk_usuario, fk_personagem_resultado)
        VALUES (${fk_usuario}, ${fk_personagem_resultado});
    `;
    return database.executar(instrucaoSql);
}

function salvarResposta(fk_tentativa, fk_pergunta, fk_alternativa) {
    var instrucaoSql = `
        INSERT INTO Resposta (fk_tentativa, fk_pergunta, fk_alternativa)
        VALUES (${fk_tentativa}, ${fk_pergunta}, ${fk_alternativa});
    `;
    return database.executar(instrucaoSql);
}

function buscarResultado(fk_usuario) {
    var instrucaoSql = `
        SELECT 
            t.tentativa_id,
            t.data_tentativa,
            p.nome AS personagem,
            p.descricao,
            p.url_imagem
        FROM TentativaQuiz t
        JOIN Personagem p ON p.personagem_id = t.fk_personagem_resultado
        WHERE t.fk_usuario = ${fk_usuario}
        ORDER BY t.data_tentativa DESC
        LIMIT 1;
    `;
    return database.executar(instrucaoSql);
}

module.exports = {
    listarPerguntas,
    salvarTentativa,
    salvarResposta,
    buscarResultado
};