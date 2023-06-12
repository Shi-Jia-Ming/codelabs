var express = require('express');
var router = express.Router();
const fileController = require('../controllers/fileController');

router.post('/upload', fileController.upload);

module.exports = router;