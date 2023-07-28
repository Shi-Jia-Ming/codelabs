var express = require('express');
var router = express.Router();
const newsController = require('../controllers/newsController');

router.get('/getNewsType', newsController.getNewsType);

router.get('/getNewsList', newsController.getNewsList);

router.get('/getExtraNewsList', newsController.getExtraNewsList);

module.exports = router;

