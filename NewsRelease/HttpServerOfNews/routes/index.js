var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/api/newsData',(err,res)=>{
  res.send({
    code:200,
    data:[{name:1},{name:2},{name:3}]
  });
});

router.post('/api/addNews',(req,res)=>{
  const newsData = req.body;
  console.log(newsData);
  res.send('hello world.');
});

module.exports = router;
