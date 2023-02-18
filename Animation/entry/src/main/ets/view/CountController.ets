import Common from '../common/constants/Const';

@Extend(Text) function textStyle () {
  .fontSize($r('app.float.size_16'))
  .fontWeight(Common.FONT_WEIGHT_500)
}

@Component
export struct CountController {
  @Link quantity: number;

  build() {
    Column() {
      Row() {
        Text($r('app.string.count'))
          .textStyle()

        Text(this.quantity.toFixed(0))
          .textStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(Common.DEFAULT_FULL_WIDTH)
      .margin({
        top: $r('app.float.size_4')
      })


      Slider({
        value: this.quantity,
        min: Common.IMAGES_MIN,
        max: Common.IMAGES_TOTAL,
        step: 1,
        style: SliderStyle.InSet
      })
        .blockColor(Color.White)
        .selectedColor($r('app.color.SliderSelectColor'))
        .margin({
          top: $r('app.float.size_5')
        })
        .showSteps(true)
        .trackThickness($r('app.float.size_20'))
        .onChange((value: number) => {
          this.quantity = value;
        })
    }
    .height(Common.CONTROLLER_WIDTH)
    .padding({
      top: $r('app.float.size_12'),
      bottom: $r('app.float.size_12'),
      left: $r('app.float.size_16'),
      right: $r('app.float.size_16')
    })
    .margin({
      bottom: $r('app.float.size_48')
    })
    .width(Common.CONTROLLER_HEIGHT)
    .borderRadius($r('app.float.size_24'))
    .backgroundColor($r('app.color.white'))
  }
}