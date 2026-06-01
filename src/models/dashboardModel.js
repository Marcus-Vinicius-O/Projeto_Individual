const database = require('../database/config');

function buscarEstatisticas() {
    var instrucaoSql = `
        SELECT * FROM Estatisticas_personagens`;
        
    return database.executar(instrucaoSql);
}

function buscarMeuResultado(fk_usuario) {
    var instrucaoSql = `
        SELECT * FROM Resultado_usuario;`;

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarEstatisticas,
    buscarMeuResultado
};