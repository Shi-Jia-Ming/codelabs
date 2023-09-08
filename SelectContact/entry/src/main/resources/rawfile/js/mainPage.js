// The different charge amount.
const chargeAmount = [10, 20, 30, 50, 100, 200, 300, 500, 1000];

// Get all amount grid.
let allGridItem = document.getElementsByClassName('grid-item');

// Set amount and onclick function of grid.
for (let i = 0;i < allGridItem.length; i++) {
  allGridItem[i].innerHTML = chargeAmount[i] + '元';
  allGridItem[i].onclick = function () {
    let amount = chargeAmount[i];
    selectAmount(amount);
  }
}

// Split the phone function.
function splitPhone(phone) {
  let regex = /(\d{3})(\d{4})(\d{4})/;
  let result = phone.replace(regex, function () {
    return RegExp.$1 + " " + RegExp.$2 + " " + RegExp.$3;
  });
  return result;
}

// Invoke ArkTS call and use the data.
function chooseContact() {
  window.ohosCallNative.callNative('chooseContact', {}, (data) => {
    const phone = data.split('_')[0];
    const name = data.split('_')[1];
    const result = splitPhone(phone);
    document.getElementById('phone_tip').innerHTML = name;
    document.getElementById('phone').value = result;
    window.ohosCallNative.callNative('changeTel', { tel: result });
  })
}

// Click the amount grid.
function selectAmount(amount) {
  for (let i = 0;i < allGridItem.length; i++) {
    allGridItem[i].classList.remove('selected');
  }
  event.target.classList.add('selected');
  window.ohosCallNative.callNative('changeAmount', { amount: amount });
}

// Contact input onclick.
function changeVal() {
  let input = event.target.value;
  let name = document.getElementById('phone_tip').innerHTML;
  const tel = document.getElementById('phone').value;
  window.ohosCallNative.callNative('changeTel', { tel: tel });
  if (name !== '手机号' && input.length < 13) {
    document.getElementById('phone_tip').innerHTML = '手机号';
  }
  let result = input;
  let phoneNumber = input.replace(/\D/g, '').slice(0, 11);
  result = phoneNumber.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1 $2 $3');
  event.target.value = result;
}