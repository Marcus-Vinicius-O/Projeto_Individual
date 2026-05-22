const express = require('express');
const router = express.Router();
const dashboardController = require('../controllers/dashboardController');

router.get('/estatisticas', dashboardController.buscarEstatisticas);
router.get('/meu-resultado/:fk_usuario', dashboardController.buscarMeuResultado);

module.exports = router;