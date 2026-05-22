const database = require('../database/config');

function buscarEstatisticas() {
    var instrucaoSql = `
        SELECT * FROM Estatisticas_personagens`;
        //UTILIZANDO VIEW
    return database.executar(instrucaoSql);
}

function buscarMeuResultado(fk_usuario) {
    var instrucaoSql = `
        SELECT * FROM Resultado_usuario;`;
    //UTILIZANDO VIEW
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarEstatisticas,
    buscarMeuResultado
};