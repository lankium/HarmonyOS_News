import  NewsTypeModel from './NewsTypeModel'
import { CommonConstant as Const } from '../common/constant/CommonConstant'
import { httpRequestGet } from '../common/utils/HttpUtil'
import ResponseResult from './ResponseResult'
import { NewsData } from '../viewmodel/NewsData'

// 二次封装接口请求
class NewsViewModel {
  getNewsTypeList(): Promise<NewsTypeModel[]> {
    return new Promise((resolve: Function, reject: Function) => {
      let url = `${Const.SERVER}/${Const.GET_NEWS_TYPE}`
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === Const.SERVER_CODE_SUCCESS) {
          resolve(data.data)
        } else {
          reject(Const.TabBars_DEFAULT_NEWS_TYPES)
        }
      }).catch(() => {
        reject(Const.TabBars_DEFAULT_NEWS_TYPES)
      })
    })
  }
  getDefaultTypeList(): NewsTypeModel[] {
    return Const.TabBars_DEFAULT_NEWS_TYPES
  }
  // news list
  getNewsList(currentPage: number, pageSize: number): Promise<NewsData[]> {
    return new Promise((resolve: Function, reject: Function) => {
      let url = `${Const.SERVER}/${Const.GET_NEWS_LIST}`
      url += `?currentPage=${currentPage}&pageSize=${pageSize}&type=xxx`

      httpRequestGet(url).then((data) => {
        if (data.code === Const.SERVER_CODE_SUCCESS) {
          resolve(data.data)
        } else {
          reject($r('app.string.page_none_msg'))
        }
      }).catch((err: Error) => {
        reject(err)
      })
    })
  }
}

let newsViewModel = new NewsViewModel()
export default newsViewModel as NewsViewModel