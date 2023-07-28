/* NewsDataModel*/
const NewsData = require('../model/NewsData');
const NewsFile = require('../model/NewsFile');

var newsDataArray = [
  new NewsData(0, '入春来，百花香', '随着气温升高，连日来，某某县某某街道的各个角度盛开了各种各样的花朵，让人眼花缭乱，装点了春天的气息。', [new NewsFile(0, '/images/ic_news_1_1.png', 0, 0), new NewsFile(1, '/images/ic_news_1_2.png', 0, 0), new NewsFile(2, '/images/ic_news_1_3.png', 0, 0)], '2022年08月16日'),
  new NewsData(1, '第四届美食节正式启动', '8月5日，某某市第四届美食节正式启动。美食节将围绕各地特色美食展开，推进各地美食文化交流。', [new NewsFile(0, '/images/ic_news_2_1.png', 0, 1), new NewsFile(1, '/images/ic_news_2_2.png', 0, 1)], '2022年8月5日'),
  new NewsData(2, '江南风景美如画', '南朝四百八十寺，多少楼台烟雨中。江南美，去过风光绮丽的江南，便久久不能忘怀，江南的雨如沐春风。', [new NewsFile(0, '/images/ic_news_3_1.png', 0, 2), new NewsFile(1, '/images/ic_news_3_2.png', 0, 2), new NewsFile(1, '/images/ic_news_3_3.png', 0, 2)], '2022年7月26日'),
  new NewsData(3, '好物推荐', '精选好物，提升家居氛围，享受美好生活。', [new NewsFile(0, '/images/ic_news_4_1.png', 0, 3), new NewsFile(1, '/images/ic_news_4_2.png', 0, 3)], '2023年4月20日'),
  new NewsData(4, '某某大桥正式建成', '今日，历经了6年的某某大桥正式建成，自从2018年起，这座大桥就汇聚了全世界的目光，他的建筑风格十分新颖。', [new NewsFile(0, '/images/ic_yunnan.png', 0, 4) ], '2022年6月11日'),
  new NewsData(5, '黑白复古风复苏', '近几年，时尚风潮不断变化，复古风又开始风靡全球。其中，黑白照片是提升复古质感的最佳利器，简洁优雅。', [new NewsFile(0, '/images/ic_yiqing.png', 0, 5), new NewsFile(1, '/images/ic_student.png', 0, 5)], '2022年6月10日'),
  new NewsData(6, '设计中的材质碰撞', '近几年，设计风格已不满足于传统的二维图形，逐渐向三维立体图形靠近，但传统的三维图形操作复杂，未来方向仍值得深究。', [new NewsFile(0, '/images/ic_student.png', 0, 6), new NewsFile(1, '/images/ic_yunnan.png', 0, 6), new NewsFile(1, '/images/ic_news_3_3.png', 0, 6)], '2022年5月19日'),
  new NewsData(7, '如何过好周末', '周末人们最喜爱做什么呢？有些人喜欢带着家人出门旅行，有些人喜欢宅在家里玩游戏，有的人喜欢约会，你呢？', [new NewsFile(0, '/images/ic_news_1_1.png', 0, 7), new NewsFile(1, '/images/ic_news_2_1.png', 0, 7)], '2022年5月15日')
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
  newsDataArray,
  newsType
}