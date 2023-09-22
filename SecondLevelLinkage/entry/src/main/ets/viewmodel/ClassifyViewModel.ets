/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ClassifyModel from '../common/bean/ClassifyModel';
import CourseModel from '../common/bean/CourseModel';
import LinkDataModel from '../common/bean/LinkDataModel';

class ClassifyViewModel {
  /**
   * Get Classify list data
   *
   * @returns Array<ClassifyModel> linkDataList
   */
  getLinkData(): Array<ClassifyModel> {
    let linkDataList: Array<ClassifyModel> = [];
    let superId: number = 0;
    LINK_DATA.forEach((item: LinkDataModel) => {
      if (superId !== item.superId) {
        // add the course classify model.
        let classifyItem: ClassifyModel = new ClassifyModel(item.superId, item.superName, []);
        linkDataList.push(classifyItem);
      }
      // add the course model.
      let courseItem: CourseModel = new CourseModel(superId, item.id, item.courseName, item.imageUrl, item.price);
      linkDataList[linkDataList.length-1].courseList.push(courseItem);
      superId = item.superId;
    });
    return linkDataList;
  }
}

let classifyViewModel = new ClassifyViewModel();

export default classifyViewModel as ClassifyViewModel;

const LINK_DATA: LinkDataModel[] = [
  new LinkDataModel(1, '热门课程', 1, '应用市场介绍', $r('app.media.ic_img_1'), 0),
  new LinkDataModel(1, '热门课程', 2, '上架流程', $r('app.media.ic_img_2'), 100),
  new LinkDataModel(1, '热门课程', 3, '应用出海', $r('app.media.ic_img_3'), 50),
  new LinkDataModel(1, '热门课程', 4, '审核政策', $r('app.media.ic_img_4'), 222),
  new LinkDataModel(1, '热门课程', 5, 'CaaS Kit - HMS Core精品实战课', $r('app.media.ic_img_5'), 256),
  new LinkDataModel(1, '热门课程', 6, '机器学习在图像分割场景中的应用', $r('app.media.ic_img_6'), 0),
  new LinkDataModel(1, '热门课程', 7, '一分钟了解华为应用内支付服务', $r('app.media.ic_img_7'), 0),
  new LinkDataModel(1, '热门课程', 8, '一分钟了解华为位置服务', $r('app.media.ic_img_8'), 400),
  new LinkDataModel(2, '热门课程', 9, 'Excel函数在商业中的应用', $r('app.media.ic_img_9'), 65),
  new LinkDataModel(2, '热门课程', 10, '“震动”手机锁屏制作', $r('app.media.ic_img_10'), 0),
  new LinkDataModel(2, '热门课程', 11, '“流体动效”手机锁屏制作', $r('app.media.ic_img_11'), 50),
  new LinkDataModel(2, '热门课程', 12, 'HUAWEI GT自定义表盘制作', $r('app.media.ic_img_12'), 70),
  new LinkDataModel(2, '热门课程', 13, '商务表盘制作', $r('app.media.ic_img_13'), 0),
  new LinkDataModel(2, '热门课程', 14, '5分钟了解跨应用、跨形态无缝登录', $r('app.media.ic_img_14'), 80),
  new LinkDataModel(2, '热门课程', 15, 'oCPC进阶功能及最新政策解读', $r('app.media.ic_img_15'), 120),
  new LinkDataModel(2, '热门课程', 16, 'HUAWEI Ads 游戏行业投放指南', $r('app.media.ic_img_16'), 160),
  new LinkDataModel(3, 'HarmonyOS', 17, 'HarmonyOS物联网开发课程', $r('app.media.ic_img_17'), 0),
  new LinkDataModel(3, 'HarmonyOS', 18, '【Hello系列直播课】第1期：手把手教你搭建开发环境', $r('app.media.ic_img_18'), 0),
  new LinkDataModel(3, 'HarmonyOS', 19, 'HarmonyOS技术训练营-10分钟快速体验HarmonyOS分布式应用', $r('app.media.ic_img_9'), 0),
  new LinkDataModel(3, 'HarmonyOS', 20, '应用开发基础：JS FA开发基础（第一期）', $r('app.media.ic_img_10'), 0),
  new LinkDataModel(3, 'HarmonyOS', 21, 'HarmonyOS Connect设备开发基础：OpenHarmony基础', $r('app.media.ic_img_1'), 60),
  new LinkDataModel(3, 'HarmonyOS', 22, '组件开发和集成：SDK集成指南（第五期）', $r('app.media.ic_img_2'), 120),
  new LinkDataModel(4, '精彩活动', 23, 'HUAWEI Developer Day•2018北京精彩回顾', $r('app.media.ic_img_3'), 0),
  new LinkDataModel(4, '精彩活动', 24, '华为AR帮你轻松打造酷炫应用', $r('app.media.ic_img_4'), 99),
  new LinkDataModel(4, '精彩活动', 25, 'AR VR应用创新大赛获奖作品', $r('app.media.ic_img_5'), 30),
  new LinkDataModel(4, '精彩活动', 26, '华为HiLink智能家居生态介绍', $r('app.media.ic_img_6'), 80),
  new LinkDataModel(4, '精彩活动', 27, '华为校园千帆行丨武汉站', $r('app.media.ic_img_7'), 160),
  new LinkDataModel(4, '精彩活动', 28, 'HUAWEI Developer Day•杭州站精彩回顾', $r('app.media.ic_img_8'), 0),
  new LinkDataModel(5, '开发者说', 29, '优秀实践分享 - 掌阅科技', $r('app.media.ic_img_9'), 0),
  new LinkDataModel(5, '开发者说', 30, '极限试驾', $r('app.media.ic_img_10'), 130),
  new LinkDataModel(5, '开发者说', 31, 'AR狙击手', $r('app.media.ic_img_11'), 100),
  new LinkDataModel(5, '开发者说', 32, '宇宙解码', $r('app.media.ic_img_12'), 100),
  new LinkDataModel(5, '开发者说', 33, 'Wars of Stone', $r('app.media.ic_img_13'), 1200),
  new LinkDataModel(5, '开发者说', 34, 'ROCK ME', $r('app.media.ic_img_14'), 156),
  new LinkDataModel(5, '开发者说', 35, '神奇AR智能宝宝', $r('app.media.ic_img_15'), 130),
  new LinkDataModel(6, '后端开发', 36, '从零开始学架构', $r('app.media.ic_img_16'), 120),
  new LinkDataModel(6, '后端开发', 37, '架构设计之异步化技术', $r('app.media.ic_img_17'), 0),
  new LinkDataModel(6, '后端开发', 38, '架构设计之页面静态化技术', $r('app.media.ic_img_18'), 0),
  new LinkDataModel(6, '后端开发', 39, 'Python极简入门', $r('app.media.ic_img_9'), 0),
  new LinkDataModel(6, '后端开发', 40, 'Python实践指南', $r('app.media.ic_img_10'), 2001),
  new LinkDataModel(6, '后端开发', 41, 'Java高级特性', $r('app.media.ic_img_1'), 30),
  new LinkDataModel(6, '后端开发', 42, 'C++核心编程', $r('app.media.ic_img_2'), 50),
  new LinkDataModel(7, '移动开发', 43, 'EMUI 9.1主题转10.0主题适配指导', $r('app.media.ic_img_3'), 0),
  new LinkDataModel(7, '移动开发', 44, '“流体动效”手机锁屏制作', $r('app.media.ic_img_4'), 0),
  new LinkDataModel(7, '移动开发', 45, '“震动”手机锁屏制作', $r('app.media.ic_img_5'), 0),
  new LinkDataModel(8, '前端开发', 46, 'DevOps新技术入门', $r('app.media.ic_img_6'), 50),
  new LinkDataModel(8, '前端开发', 47, 'Vue.js 框架开发系列课程', $r('app.media.ic_img_16'), 60),
  new LinkDataModel(8, '前端开发', 48, 'jQuery实例精讲', $r('app.media.ic_img_8'), 80),
  new LinkDataModel(8, '前端开发', 49, 'JavaScript 编程技巧与实战', $r('app.media.ic_img_9'), 300),
  new LinkDataModel(8, '前端开发', 50, '基于 Bootstrap 框架开发技巧实战', $r('app.media.ic_img_10'), 150),
  new LinkDataModel(8, '前端开发', 51, 'Java Web开发课程', $r('app.media.ic_img_11'), 200),
  new LinkDataModel(8, '前端开发', 52, 'JavaScript 设计模式', $r('app.media.ic_img_12'), 0),
  new LinkDataModel(8, '前端开发', 53, 'HTML入门基础系列课程', $r('app.media.ic_img_13'), 0),
  new LinkDataModel(8, '前端开发', 54, '前端系列第7期-微前端–架构介绍篇', $r('app.media.ic_img_14'), 0),
  new LinkDataModel(8, '前端开发', 55, 'Web安全系列课程', $r('app.media.ic_img_15'), 0)
]