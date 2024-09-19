import NewsTypeModel from '../viewmodel/NewsTypeModel'
import newsViewModel from '../viewmodel/NewsViewModel'
import { CommonConstant as Const } from '../common/constant/CommonConstant'
import NewsList from '../view/NewsList'

@Component
export default struct TabBar {
  @State tabBarArray: NewsTypeModel[] = newsViewModel.getDefaultTypeList()
  @State currentIndex: number = 0

  aboutToAppear(): void {
    newsViewModel.getNewsTypeList().then((typeList: NewsTypeModel[]) => {
      this.tabBarArray = typeList
    }).catch((typeList: NewsTypeModel[]) => {
      this.tabBarArray = typeList
    })
  }

  @Builder
  TabBuilder(index: number) {
    Column() {
      Text(this.tabBarArray[index].name)
        .height(Const.FULL_HEIGHT)
        .padding({ left: Const.TabBars_HORIZONTAL_PADDING, right: Const.TabBars_HORIZONTAL_PADDING })
        .fontSize(this.currentIndex === index ? Const.TabBars_SELECT_TEXT_FONT_SIZE :
        Const.TabBars_UN_SELECT_TEXT_FONT_SIZE)
        .fontWeight(this.currentIndex == index ? Const.TabBars_SELECT_TEXT_FONT_WEIGHT :
        Const.TabBars_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.fontColor_text3'))
    }
  }

  build() {
    Tabs() {
      ForEach(this.tabBarArray, (tabsItem: NewsTypeModel, index: number) => {
        TabContent() {
          Column() {
            // 新闻组件
            NewsList()
          }
        }
        .tabBar(this.TabBuilder(index))
      })
    }
    .barMode(BarMode.Scrollable)
    .barWidth(Const.TabBars_BAR_WIDTH)
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}