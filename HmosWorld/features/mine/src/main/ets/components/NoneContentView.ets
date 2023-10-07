import Constants from '../constants/Constants';

@Component
export struct NoneContentView {
  imgSrc: Resource = $r('app.media.ic_browse_no');
  description: Resource = $r('app.string.to_view');

  build() {
    Row() {
      Column() {
        Row() {
          Image(this.imgSrc)
            .size({ width: $r('app.float.none_view_image_size'), height: $r('app.float.none_view_image_size') })
        }
        .justifyContent(FlexAlign.Center)
        .margin({ top: $r('app.float.none_view_image_padding') })
        .width(Constants.FULL_SCREEN)

        Text(this.description)
          .fontColor($r('app.color.hmos_medium_black'))
          .fontSize($r('app.float.title_font_size'))
          .padding({ top: $r('app.float.none_view_description_padding') })
      }
      .height(Constants.FULL_SCREEN)
    }
    .width(Constants.FULL_SCREEN)
  }
}