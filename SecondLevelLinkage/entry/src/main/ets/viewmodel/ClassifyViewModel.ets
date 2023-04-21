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
        let classifyItem: ClassifyModel = {
          classifyId: item.superId,
          classifyName: item.superName,
          courseList: []
        };
        linkDataList.push(classifyItem);
      }
      // add the course model.
      let courseItem: CourseModel = {
        classifyId: superId,
        courseId: item.id,
        courseName: item.courseName,
        imageUrl: item.imageUrl,
        price: item.price
      };
      linkDataList[linkDataList.length-1].courseList.push(courseItem);
      superId = item.superId;
    });
    return linkDataList;
  }
}

let classifyViewModel = new ClassifyViewModel();
export default classifyViewModel as ClassifyViewModel;

const LINK_DATA: LinkDataModel[] = [
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 1,
    'courseName': '应用市场介绍',
    'imageUrl': $r('app.media.ic_img_1'),
    'price': 0
  },
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 2,
    'courseName': '上架流程',
    'imageUrl': $r('app.media.ic_img_2'),
    'price': 100
  },
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 3,
    'courseName': '应用出海',
    'imageUrl': $r('app.media.ic_img_3'),
    'price': 50
  },
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 4,
    'courseName': '审核政策',
    'imageUrl': $r('app.media.ic_img_4'),
    'price': 222
  },
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 5,
    'courseName': 'CaaS Kit - HMS Core精品实战课',
    'imageUrl': $r('app.media.ic_img_5'),
    'price': 256
  },
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 6,
    'courseName': '机器学习在图像分割场景中的应用',
    'imageUrl': $r('app.media.ic_img_6'),
    'price': 0
  },
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 7,
    'courseName': '一分钟了解华为应用内支付服务',
    'imageUrl': $r('app.media.ic_img_7'),
    'price': 0
  },
  {
    'superId': 1,
    'superName': '热门课程',
    'id': 8,
    'courseName': '一分钟了解华为位置服务',
    'imageUrl': $r('app.media.ic_img_8'),
    'price': 400
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 9,
    'courseName': 'Excel函数在商业中的应用',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 65
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 10,
    'courseName': '“震动”手机锁屏制作',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 0
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 11,
    'courseName': '“流体动效”手机锁屏制作',
    'imageUrl': $r('app.media.ic_img_11'),
    'price': 50
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 12,
    'courseName': 'HUAWEI GT自定义表盘制作',
    'imageUrl': $r('app.media.ic_img_12'),
    'price': 70
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 13,
    'courseName': '商务表盘制作',
    'imageUrl': $r('app.media.ic_img_13'),
    'price': 0
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 14,
    'courseName': '5分钟了解跨应用、跨形态无缝登录',
    'imageUrl': $r('app.media.ic_img_14'),
    'price': 80
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 15,
    'courseName': 'oCPC进阶功能及最新政策解读',
    'imageUrl': $r('app.media.ic_img_15'),
    'price': 120
  },
  {
    'superId': 2,
    'superName': '最新课程',
    'id': 16,
    'courseName': 'HUAWEI Ads 游戏行业投放指南',
    'imageUrl': $r('app.media.ic_img_16'),
    'price': 160
  },
  {
    'superId': 3,
    'superName': 'HarmonyOS',
    'id': 17,
    'courseName': 'HarmonyOS物联网开发课程',
    'imageUrl': $r('app.media.ic_img_17'),
    'price': 1020
  },
  {
    'superId': 3,
    'superName': 'HarmonyOS',
    'id': 18,
    'courseName': '【Hello系列直播课】第1期：手把手教你搭建开发环境',
    'imageUrl': $r('app.media.ic_img_18'),
    'price': 0
  },
  {
    'superId': 3,
    'superName': 'HarmonyOS',
    'id': 19,
    'courseName': 'HarmonyOS技术训练营-10分钟快速体验HarmonyOS分布式应用',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 0
  },
  {
    'superId': 3,
    'superName': 'HarmonyOS',
    'id': 20,
    'courseName': '应用开发基础：JS FA开发基础（第一期）',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 0
  },
  {
    'superId': 3,
    'superName': 'HarmonyOS',
    'id': 21,
    'courseName': 'HarmonyOS Connect设备开发基础：OpenHarmony基础',
    'imageUrl': $r('app.media.ic_img_1'),
    'price': 60
  },
  {
    'superId': 3,
    'superName': 'HarmonyOS',
    'id': 22,
    'courseName': '组件开发和集成：SDK集成指南（第五期）',
    'imageUrl': $r('app.media.ic_img_2'),
    'price': 120
  },
  {
    'superId': 4,
    'superName': '精彩活动',
    'id': 23,
    'courseName': 'HUAWEI Developer Day•2018北京精彩回顾',
    'imageUrl': $r('app.media.ic_img_3'),
    'price': 0
  },
  {
    'superId': 4,
    'superName': '精彩活动',
    'id': 24,
    'courseName': '华为AR帮你轻松打造酷炫应用',
    'imageUrl': $r('app.media.ic_img_4'),
    'price': 99
  },
  {
    'superId': 4,
    'superName': '精彩活动',
    'id': 25,
    'courseName': 'AR VR应用创新大赛获奖作品',
    'imageUrl': $r('app.media.ic_img_5'),
    'price': 30
  },
  {
    'superId': 4,
    'superName': '精彩活动',
    'id': 26,
    'courseName': '华为HiLink智能家居生态介绍',
    'imageUrl': $r('app.media.ic_img_6'),
    'price': 80
  },
  {
    'superId': 4,
    'superName': '精彩活动',
    'id': 27,
    'courseName': '华为校园千帆行丨武汉站',
    'imageUrl': $r('app.media.ic_img_7'),
    'price': 160
  },
  {
    'superId': 4,
    'superName': '精彩活动',
    'id': 28,
    'courseName': 'HUAWEI Developer Day•杭州站精彩回顾',
    'imageUrl': $r('app.media.ic_img_8'),
    'price': 0
  },
  {
    'superId': 5,
    'superName': '开发者说',
    'id': 29,
    'courseName': '优秀实践分享 - 掌阅科技',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 0
  },
  {
    'superId': 5,
    'superName': '开发者说',
    'id': 30,
    'courseName': '极限试驾',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 130
  },
  {
    'superId': 5,
    'superName': '开发者说',
    'id': 31,
    'courseName': 'AR狙击手',
    'imageUrl': $r('app.media.ic_img_11'),
    'price': 100
  },
  {
    'superId': 5,
    'superName': '开发者说',
    'id': 32,
    'courseName': '宇宙解码',
    'imageUrl': $r('app.media.ic_img_12'),
    'price': 100
  },
  {
    'superId': 5,
    'superName': '开发者说',
    'id': 33,
    'courseName': 'Wars of Stone',
    'imageUrl': $r('app.media.ic_img_13'),
    'price': 1200
  },
  {
    'superId': 5,
    'superName': '开发者说',
    'id': 34,
    'courseName': 'ROCK ME',
    'imageUrl': $r('app.media.ic_img_14'),
    'price': 156
  },
  {
    'superId': 5,
    'superName': '开发者说',
    'id': 35,
    'courseName': '神奇AR智能宝宝',
    'imageUrl': $r('app.media.ic_img_15'),
    'price': 130
  },
  {
    'superId': 6,
    'superName': '后端开发',
    'id': 36,
    'courseName': '从零开始学架构',
    'imageUrl': $r('app.media.ic_img_16'),
    'price': 120
  },
  {
    'superId': 6,
    'superName': '后端开发',
    'id': 37,
    'courseName': '架构设计之异步化技术',
    'imageUrl': $r('app.media.ic_img_17'),
    'price': 0
  },
  {
    'superId': 6,
    'superName': '后端开发',
    'id': 38,
    'courseName': '架构设计之页面静态化技术',
    'imageUrl': $r('app.media.ic_img_18'),
    'price': 0
  },
  {
    'superId': 6,
    'superName': '后端开发',
    'id': 39,
    'courseName': 'Python极简入门',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 0
  },
  {
    'superId': 6,
    'superName': '后端开发',
    'id': 40,
    'courseName': 'Python实践指南',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 2001
  },
  {
    'superId': 6,
    'superName': '后端开发',
    'id': 41,
    'courseName': 'Java高级特性',
    'imageUrl': $r('app.media.ic_img_1'),
    'price': 30
  },
  {
    'superId': 6,
    'superName': '后端开发',
    'id': 42,
    'courseName': 'C++核心编程',
    'imageUrl': $r('app.media.ic_img_2'),
    'price': 50
  },
  {
    'superId': 7,
    'superName': '移动开发',
    'id': 43,
    'courseName': 'EMUI 9.1主题转10.0主题适配指导',
    'imageUrl': $r('app.media.ic_img_3'),
    'price': 0
  },
  {
    'superId': 7,
    'superName': '移动开发',
    'id': 44,
    'courseName': '“流体动效”手机锁屏制作',
    'imageUrl': $r('app.media.ic_img_4'),
    'price': 0
  },
  {
    'superId': 7,
    'superName': '移动开发',
    'id': 45,
    'courseName': '“震动”手机锁屏制作',
    'imageUrl': $r('app.media.ic_img_5'),
    'price': 0
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 46,
    'courseName': 'DevOps新技术入门',
    'imageUrl': $r('app.media.ic_img_6'),
    'price': 50
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 47,
    'courseName': 'Vue.js 框架开发系列课程',
    'imageUrl': $r('app.media.ic_img_7'),
    'price': 60
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 48,
    'courseName': 'jQuery实例精讲',
    'imageUrl': $r('app.media.ic_img_8'),
    'price': 80
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 49,
    'courseName': 'JavaScript 编程技巧与实战',
    'imageUrl': $r('app.media.ic_img_9'),
    'price': 300
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 50,
    'courseName': '基于 Bootstrap 框架开发技巧实战',
    'imageUrl': $r('app.media.ic_img_10'),
    'price': 150
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 51,
    'courseName': 'Java Web开发课程',
    'imageUrl': $r('app.media.ic_img_11'),
    'price': 200
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 52,
    'courseName': 'JavaScript 设计模式',
    'imageUrl': $r('app.media.ic_img_12'),
    'price': 0
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 53,
    'courseName': 'HTML入门基础系列课程',
    'imageUrl': $r('app.media.ic_img_13'),
    'price': 0
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 54,
    'courseName': '前端系列第7期-微前端–架构介绍篇',
    'imageUrl': $r('app.media.ic_img_14'),
    'price': 100
  },
  {
    'superId': 8,
    'superName': '前端开发',
    'id': 55,
    'courseName': 'Web安全系列课程',
    'imageUrl': $r('app.media.ic_img_15'),
    'price': 0
  }
]