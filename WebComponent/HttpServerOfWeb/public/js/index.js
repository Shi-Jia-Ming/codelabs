/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Award name array
let prizesArr = ["啤酒", "奶茶", "汉堡", "咖啡", "西瓜", "鸡腿", "柠檬", "蛋糕"];
// Image array
let arrBigImg = ["./img/1-beer.png", "./img/2-milk.png", "./img/3-hamburg.png",
  "./img/4-coffee.png", "./img/5-watermelon.png", "./img/6-drumstick.png",
  "./img/7-lemon.png", "./img/8-cake.png", "./img/9-prizes.png"];

// Get All Award Cells
let allPrizesLi = document.querySelectorAll('.prizes-li');
// Get Pictures
let prizesImg = document.querySelectorAll('.pic');

// Initial value of rotation
let count = 0;
let isClick = true;
let index = 3;
// Turn to which position
let prizesPosition = 0;

// Bind an IMG
for (let j = 0;j < prizesImg.length; j++) {
  prizesImg[j].src = arrBigImg[j];
}
// Rotation speed. The larger the value, the slower the speed
let speed = 500;

// rotation function
function roll() {
  // velocity decay
  speed -= 50;
  if (speed <= 10) {
    speed = 10;
  }

  // Remove all active class names for each call
  for (let j = 0; j < allPrizesLi.length; j++) {
    allPrizesLi[j].classList.remove('active');
  }
  prizesPosition++;

  // Calculate the number of turns
  if (prizesPosition >= allPrizesLi.length - 1) {
    prizesPosition = 0;
    count++;
  }

  allPrizesLi[prizesPosition].classList.add('active');
  let initSpeed = 500;
  let timer;
  // Total number of revolutions at least
  let totalCount = 5;

  // Stop when the number of turns and the specified position are met
  if (count >= totalCount && (prizesPosition + 1) === index) {
    clearTimeout(timer);
    isClick = true;
    speed = initSpeed;
    // Wait for 1s to open the pop-up window
    timer = setTimeout(openDialog, 1000);
  } else {
    // Wait for 1s to open the pop-up window
    timer = setTimeout(roll, speed);
    // Last lap deceleration
    if (count >= totalCount - 1 || speed <= 50) {
      speed += 100;
    }
  }
}

// Draw Start Function
function startDraw() {
  // Prevent multiple triggering of the lottery
  if (isClick) {
    count = 0;
    // Randomly generate the winning position
    index = Math.floor(Math.random() * prizesArr.length + 1);
    roll();
    isClick = false;
  }
}

function openDialog() {
  confirm(prizesArr[prizesPosition]);
}