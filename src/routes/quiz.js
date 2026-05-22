const express = require('express');
const router = express.Router();
const quizController = require('../controllers/quizController');

router.get('/perguntas', quizController.listarPerguntas);
router.post('/responder', quizController.salvarRespostas);
router.get('/resultado/:fk_usuario', quizController.buscarResultado);

module.exports = router;