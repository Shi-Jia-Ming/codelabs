/*  controllers/newsController.js */
const dbFile = require('../model/NewsDataModel');
const NewsData = require('../model/NewsData');
const NewsFile = require('../model/NewsFile');

const DEFAULT_PAGE_SIZE = 4;
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
 * Get news list by currentPage and pageSize.
 *
 * @param req request
 * @param res response
 */
const getExtraNewsList = (req, res) => {
  let {currentPage = 1, pageSize = DEFAULT_PAGE_SIZE} = req.query;
  let newsList = dbFile.newsExtraDataArray.slice((currentPage - 1) * pageSize, currentPage * pageSize);
  res.send({ code: SUCCESS_CODE, data: newsList, msg: '' });
};

module.exports = {
  getNewsType,
  getNewsList,
  getExtraNewsList
}