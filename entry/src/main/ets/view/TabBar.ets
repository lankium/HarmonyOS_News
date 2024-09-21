import NewsTypeModel from '../viewmodel/NewsTypeModel'
import NewsViewModel from '../viewmodel/NewsViewModel'
import { CommonConstant as Const } from '../common/constant/CommonConstant'
import NewsList from '../view/NewsList'

@Component
export default struct TabBar {
  @State tabBarArray: NewsTypeModel[] = NewsViewModel.getDefaultTypeList()
  @State currentIndex: number = 0

  aboutToAppear(): void {
    NewsViewModel.getNewsTypeList().then((typeList: NewsTypeModel[]) => {
      this.tabBarArray = typeList
    }).catch((typeList: NewsTypeModel[]) => {
      this.tabBarArray = typeList
    })
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabBarArray[index].name)
        .height(Const.FULL_HEIGHT)
        .padding({left: Const.TabBars_HORIZONTAL_PADDING, right: Const.TabBars_HORIZONTAL_PADDING})
        .fontSize(this.currentIndex === index ? Const.TabBars_SELECT_TEXT_FONT_SIZE : Const.TabBars_UN_SELECT_TEXT_FONT_SIZE)
        .fontWeight(this.currentIndex === index ? Const.TabBars_SELECT_TEXT_FONT_WEIGHT : Const.TabBars_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.fontColor_text3'))
    }
  }


  build() {
    Tabs() {
      ForEach(this.tabBarArray, (tabsItem: NewsTypeModel, index: number) => {
        TabContent() {
          Column() {
            // 新闻组件
            NewsList({currentIndex: this.currentIndex})
          }
        }
        .tabBar(this.TabBuilder(tabsItem.id))
      })
    }
    .barWidth(Const.TabBars_BAR_WIDTH)
    .barHeight(Const.TabBars_BAR_HEIGHT)
    .barMode(BarMode.Scrollable)
    .onChange((index: number) => {
      // console.log(`${index}`)
      this.currentIndex = index
    })
  }
}