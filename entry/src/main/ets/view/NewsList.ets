import CustomRefreshLoadLayout from '../view/CustomRefreshLoadLayout'
import { CustomRefreshLoadLayoutClass } from '../viewmodel/NewsData'
import NewsModel from '../viewmodel/NewsModel'
import { CommonConstant as Const, PageState } from '../common/constant/CommonConstant'
import NewsViewModel from '../viewmodel/NewsViewModel'
import { NewsData } from '../viewmodel/NewsData'
import NewsItem from '../view/NewsItem'
import RefreshLayout from './RefreshLayout'

@Component
export default struct NewsList {
  @State newsModel: NewsModel = new NewsModel()
  @Watch('changeCategory') @Link currentIndex: number

  // 当 tab 切换时加载数据
  changeCategory() {
    //   request
    this.newsModel.currentPage = 1
    NewsViewModel.getNewsList(this.newsModel.currentPage, this.newsModel.pageSize)
      .then((res) => {
        this.newsModel.pageState = PageState.Success
        if (res.length === this.newsModel.pageSize) {
          this.newsModel.currentPage++
          this.newsModel.hasMore = true
        } else {
          this.newsModel.hasMore = false
        }
        this.newsModel.newsData = res
      })
  }

  aboutToAppear(): void {
    this.changeCategory()
  }

  build() {
    Column() {
      if (this.newsModel.pageState === PageState.Loading) {
        this.LoadingLayout()
      } else if (this.newsModel.pageState === PageState.Success) {
        this.ListLayout()
      } else {
        Text('数据为空')
      }
    }
  }

  // 加载中的ui组件
  @Builder
  LoadingLayout() {
    CustomRefreshLoadLayout({
      customRefreshLoadLayoutClass: new CustomRefreshLoadLayoutClass(
        true,
        $r('app.media.ic_pull_up_load'),
        $r('app.string.pull_up_load_text'),
        30
      )
    })
  }

  // 新闻列表
  @Builder
  ListLayout() {
    List() {
      // todo 下拉刷新
      ListItem() {
        RefreshLayout({
          refreshLayoutClass: new CustomRefreshLoadLayoutClass(this.newsModel.isVisiblePullDown,
            this.newsModel.pullDownRefreshImage,
            this.newsModel.pullDownRefreshText,
            this.newsModel.pullDownRefreshHeight)
        })
      }

      ForEach(this.newsModel.newsData, (item: NewsData) => {
        ListItem() {
          NewsItem({ newsData: item })
        }
        .height(Const.NewsListConstant_ITEM_HEIGHT)
        .backgroundColor($r('app.color.white'))
        .margin({ top: Const.NewsListConstant_ITEM_MARGIN_TOP })
        .borderRadius(Const.NewsListConstant_ITEM_BORDER_RADIUS)
      })
      // todo 上拉加载
    }
    .width(Const.NewsListConstant_LIST_WIDTH)
    .height(Const.FULL_HEIGHT)
    .margin({ left: Const.NewsListConstant_LIST_MARGIN_LEFT, right: Const.NewsListConstant_LIST_MARGIN_RIGHT })
    .backgroundColor($r('app.color.listColor'))
    .divider({
      color: $r('app.color.dividerColor'),
      strokeWidth: Const.NewsListConstant_LIST_DIVIDER_STROKE_WIDTH,
      endMargin: Const.NewsListConstant_LIST_MARGIN_RIGHT
    })
    // Remove the rebound effect.
    .edgeEffect(EdgeEffect.None)
    .offset({ x: 0, y: `${this.newsModel.offsetY}px` })
    .onScrollIndex((start: number, end: number) => {
      // Listen to the first index of the current list.
      this.newsModel.startIndex = start;
      this.newsModel.endIndex = end;
    })
  }
}