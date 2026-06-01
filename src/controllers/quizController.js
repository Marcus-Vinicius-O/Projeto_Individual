const quizModel = require('../models/quizModel');

function listarPerguntas(req, res) {
    quizModel.listarPerguntas()
        .then(function (resultado) {
            res.status(200).json(resultado);
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json({ erro: "Erro ao buscar perguntas." });
        });
}
function salvarRespostas(req, res) {
    const { fk_usuario, respostas, fk_personagem_resultado } = req.body;

    quizModel.salvarTentativa(fk_usuario, fk_personagem_resultado)
        .then(function (resultado) {
            const fk_tentativa = resultado.insertId;

            const promessas = [];
            for (let i = 0; i < respostas.length; i++) {
                promessas.push(quizModel.salvarResposta(fk_tentativa, respostas[i].fk_pergunta, respostas[i].fk_alternativa));
            }

            return Promise.all(promessas);
        })
        .then(function () {
            res.status(201).json({ mensagem: "Respostas salvas com sucesso!" });
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json({ erro: "Erro ao salvar respostas." });
        });
}
function buscarResultado(req, res) {
    const { fk_usuario } = req.params;

    quizModel.buscarResultado(fk_usuario)
        .then(function (resultado) {
            if (resultado.length === 0) {
                res.status(404).json({ mensagem: "Nenhum resultado encontrado." });
            } else {
                res.status(200).json(resultado[0]);
            }
        })
        .catch(function (erro) {
            console.log(erro);
            res.status(500).json({ erro: "Erro ao buscar resultado." });
        });
}

module.exports = {
    listarPerguntas,
    salvarRespostas,
    buscarResultado
};