import AccountItem from '../common/bean/AccountItem';

export const PayList: Array<AccountItem> = [
  {
    icon: $rawfile('foods.png'),
    icon_selected: $rawfile('foods_selected.png'),
    accountType: 0,
    typeText: '吃饭'
  },
  {
    icon: $rawfile('snacks.png'),
    icon_selected: $rawfile('snacks_selected.png'),
    accountType: 0,
    typeText: '零食'
  },
  {
    icon: $rawfile('fuel.png'),
    icon_selected: $rawfile('fuel_selected.png'),
    accountType: 0,
    typeText: '汽车加油'
  },
  {
    icon: $rawfile('travel.png'),
    icon_selected: $rawfile('travel_selected.png'),
    accountType: 0,
    typeText: '旅游'
  },
  {
    icon: $rawfile('games.png'),
    icon_selected: $rawfile('games_selected.png'),
    accountType: 0,
    typeText: '娱乐'
  },
  {
    icon: $rawfile('pets.png'),
    icon_selected: $rawfile('pets_selected.png'),
    accountType: 0,
    typeText: '宠物'
  }
]

export const EarnList: Array<AccountItem> = [
  {
    icon: $rawfile('income.png'),
    icon_selected: $rawfile('income_selected.png'),
    accountType: 1,
    typeText: '工作收入'
  },
  {
    icon: $rawfile('invest.png'),
    icon_selected: $rawfile('invest_selected.png'),
    accountType: 1,
    typeText: '投资'
  }
]

export const ImageList = {
  '吃饭': $rawfile('foods.png'),
  '零食': $rawfile('snacks.png'),
  '汽车加油': $rawfile('fuel.png'),
  '旅游': $rawfile('travel.png'),
  '娱乐': $rawfile('games.png'),
  '宠物': $rawfile('pets.png'),
  '工作收入': $rawfile('income.png'),
  '投资': $rawfile('invest.png')
}