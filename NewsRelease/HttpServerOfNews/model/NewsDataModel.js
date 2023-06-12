/* NewsDataModel*/
const NewsData = require('../model/NewsData');
const NewsFile = require('../model/NewsFile');


var maxNewsId = 5;
var newsDataArray = [
  new NewsData(4, '中考学子奔赴考场 市区这些路段绕行', '中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行', [new NewsFile(0, '/images/ic_yunnan.png', 0, 0), new NewsFile(1, '/images/ic_student.png', 0, 1)], '2023年04月20日'),
  new NewsData(3, '中考学子奔赴考场 市区这些路段绕行', '中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行', [new NewsFile(0, '/images/ic_student.png', 0, 0), new NewsFile(1, '/images/ic_yiqing.png', 0, 1)], '2023年04月20日'),
  new NewsData(2, '中考学子奔赴考场', '中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行', [new NewsFile(0, '/images/ic_yunnan.png', 0, 0), new NewsFile(1, '/images/ic_yiqing.png', 0, 1)], '2023年04月20日'),
  new NewsData(1, '中考学子奔赴考场-----', '中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行', [new NewsFile(1, '/images/ic_yiqing.png', 0, 1)], '2023年04月20日'),
  new NewsData(0, '中考学子奔赴考场中考学子奔赴考场11', '中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行中考学子奔赴考场 市区这些路段绕行', [new NewsFile(2, '/images/ic_yunnan.png', 0, 2)], '2023年04月20日')
];

var maxFileId = 3;
var newsFileArray = [
  new NewsFile(0, '/images/ic_student.png', 0, 0),
  new NewsFile(1, '/images/ic_yiqing.png', 0, 1),
  new NewsFile(2, '/images/ic_yunnan.png', 0, 2),
];

var newsType = [
  { id: 0, name: '全部' },
  { id: 1, name: '国内' },
  { id: 2, name: '国际' },
  { id: 3, name: '娱乐' },
  { id: 4, name: '军事' },
  { id: 5, name: '体育' },
  { id: 6, name: '科技' },
  { id: 7, name: '财经' }
];

module.exports = {
  maxNewsId,
  maxFileId,
  newsDataArray,
  newsFileArray,
  newsType
}