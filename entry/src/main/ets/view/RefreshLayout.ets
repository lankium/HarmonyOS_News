import CustomRefreshLoadLayout from './CustomRefreshLoadLayout'
import { CustomRefreshLoadLayoutClass } from '../viewmodel/NewsData'

@Component
export default struct RefreshLayout {
  @ObjectLink refreshLayoutClass: CustomRefreshLoadLayoutClass

  build() {
    Column() {
      CustomRefreshLoadLayout({
        customRefreshLoadLayoutClass: new CustomRefreshLoadLayoutClass(
          this.refreshLayoutClass.isVisible,
          this.refreshLayoutClass.imageSrc,
          this.refreshLayoutClass.textValue,
          this.refreshLayoutClass.heightValue
        )
      })
    }
  }
}