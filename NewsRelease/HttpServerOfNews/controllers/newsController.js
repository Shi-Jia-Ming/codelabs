/*  controllers/newsController.js */
const dbFile = require('../model/NewsDataModel');
const NewsData = require('../model/NewsData');
const NewsFile = require('../model/NewsFile');

const YEAR = '年';
const MONTH = '月';
const DAY = '日';
const DEFAULT_PAGE_SIZE = 10;
const SUCCESS_CODE = 'success';

/**
 * Get news type list.
 *
 * @param req request
 * @param res response
 */
const getNewsType = (req, res) => {
  res.send({ code: SUCCESS_CODE, data: dbFile.newsType, msg: '' });
};

/**
 * Get news list by currentPage and pageSize.
 *
 * @param req request
 * @param res response
 */
const getNewsList = (req, res) => {
  let {currentPage = 1, pageSize = DEFAULT_PAGE_SIZE} = req.query;
  let newsList = dbFile.newsDataArray.slice((currentPage - 1) * pageSize, currentPage * pageSize);
  res.send({ code: SUCCESS_CODE, data: newsList, msg: '' });
};

/**
 * Get news type list.
 *
 * @param req request
 * @param res response
 */
const getNewsFiles = (req, res) => {
  res.send({ code: SUCCESS_CODE, data: dbFile.newsFileArray, msg: '' });
};

/**
 * Post news data.
 *
 * @param req request
 * @param res response
 */
const addNews = (req, res) => {
  var news = req.body;
  let nowDate = new Date();
  let month = (nowDate.getMonth() + 1).toString().padStart(2, '0');
  let day = nowDate.getDate().toString().padStart(2, '0');
  let createDate = nowDate.getFullYear() + YEAR + month + MONTH + day + DAY;
  var imageFile = new NewsFile(dbFile.maxFileId, news.imagesUrl[0].url, 0, dbFile.maxNewsId);
  var newsData = new NewsData(dbFile.maxNewsId, news.title, news.content, [imageFile], createDate);
  dbFile.newsDataArray.unshift(newsData);
  dbFile.newsFileArray.push(imageFile);
  dbFile.maxNewsId++;
  dbFile.maxFileId++;
  res.send({ code: SUCCESS_CODE, data: dbFile.newsDataArray, msg: '' });
};

module.exports = {
  getNewsType,
  getNewsList,
  getNewsFiles,
  addNews
}