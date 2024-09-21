import { CustomRefreshLoadLayoutClass } from '../viewmodel/NewsData'
import { CommonConstant as Const } from '../common/constant/CommonConstant'

@Component
export default struct CustomLayout {
  @ObjectLink customRefreshLoadLayoutClass: CustomRefreshLoadLayoutClass

  build() {
    Row() {
      Image(this.customRefreshLoadLayoutClass.imageSrc)
        .width(Const.RefreshLayout_IMAGE_WIDTH)
        .height(Const.RefreshLayout_IMAGE_HEIGHT)
      Text(this.customRefreshLoadLayoutClass.textValue)
        .margin({
          left: Const.RefreshLayout_TEXT_MARGIN_LEFT,
          bottom: Const.RefreshLayout_TEXT_MARGIN_BOTTOM
        })
        .fontSize(Const.RefreshLayout_TEXT_FONT_SIZE)
        .textAlign(TextAlign.Center)
    }
    .clip(true)
    .width(Const.FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
    .height(this.customRefreshLoadLayoutClass.heightValue)
  }
}







