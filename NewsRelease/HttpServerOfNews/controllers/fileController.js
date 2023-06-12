/* controllers/fileController.js */

const BAD_REQUEST_STATUS = 400;
const SYSTEM_ERROR_STATUS = 500;
const SUCCESS_STATUS = 200;

/**
 * Upload files.
 *
 * @param req request
 * @param res response
 */
const upload = (req, res) => {
  let fileObj = null;
  let filePath = '';
  if (!req || !req.files || (Object.keys(req.files).length === 0)) {
    res.status(BAD_REQUEST_STATUS).send({
      code: BAD_REQUEST_STATUS,
      msg: 'Bad Request.'
    });
  }
  fileObj = req.files.file;
  filePath = './public/images/' + fileObj.name;
  fileObj.mv(filePath, (err) => {
    if (err) {
      return res.status(SYSTEM_ERROR_STATUS).send({
        code: SYSTEM_ERROR_STATUS,
        msg: 'system error.'
      });
    }
  });

  res.send({
    code: SUCCESS_STATUS,
    msg: 'upload successfully.',
    path: '/images/' + fileObj.name
  })
}

module.exports = {
  upload
}