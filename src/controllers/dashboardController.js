const dashboardModel = require('../models/dashboardModel');

function buscarEstatisticas(req, res) {
    dashboardModel.buscarEstatisticas()
        .then(function(resultado) {
            res.status(200).json(resultado);
        })
        .catch(function(erro) {
            console.log(erro);
            res.status(500).json({ erro: "Erro ao buscar estatísticas." });
        });
}

function buscarMeuResultado(req, res) {
    const { fk_usuario } = req.params;

    dashboardModel.buscarMeuResultado(fk_usuario)
        .then(function(resultado) {
            if (resultado.length === 0) {
                res.status(404).json({ mensagem: "Nenhum resultado encontrado." });
            } else {
                res.status(200).json(resultado[0]);
            }
        })
        .catch(function(erro) {
            console.log(erro);
            res.status(500).json({ erro: "Erro ao buscar resultado." });
        });
}

module.exports = {
    buscarEstatisticas,
    buscarMeuResultado
};

