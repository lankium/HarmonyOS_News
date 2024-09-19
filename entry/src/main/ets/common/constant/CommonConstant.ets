import NewsTypeModel from '../../viewmodel/NewsTypeModel'

export class CommonConstant {
  // 接口的 host
  static readonly SERVER: string = 'http://192.168.1.59:9588'
  // 获取新闻类型
  static readonly GET_NEWS_TYPE: string = 'news/getNewsType'
  // 允许接口最大的耗时
  static readonly HTTP_READ_TIMEOUT: number = 10000
  // 请求成功的状态码
  static readonly HTTP_CODE_200: number = 200
  // 后端返回正确时的 code
  static readonly SERVER_CODE_SUCCESS: string = 'success'
  // 默认的 TabBar
  static readonly TabBars_DEFAULT_NEWS_TYPES: Array<NewsTypeModel> = [
    { id: 0, name: '全部' },
    { id: 1, name: '国内' },
    { id: 2, name: '国际' },
    { id: 3, name: '娱乐' },
    { id: 4, name: '军事' },
    { id: 5, name: '体育' },
    { id: 6, name: '科技' },
    { id: 7, name: '财经' }
  ]
  // full 高度
  static readonly FULL_HEIGHT: string = '100%'
  static readonly FULL_WIDTH: string = '100%'
  static readonly TabBars_HORIZONTAL_PADDING: string = '2.2%'
  static readonly TabBars_BAR_WIDTH: string = '100%'
  static readonly TabBars_BAR_HEIGHT: string = '7.2%'
  static readonly TabBars_UN_SELECT_TEXT_FONT_SIZE: number = 18;
  static readonly TabBars_SELECT_TEXT_FONT_SIZE: number = 24;
  static readonly TabBars_UN_SELECT_TEXT_FONT_WEIGHT: number = 400;
  static readonly TabBars_SELECT_TEXT_FONT_WEIGHT: number = 700;
  /**
   * The RefreshLayout constants.
   */
  static readonly RefreshLayout_MARGIN_LEFT: string = '40%';
  static readonly RefreshLayout_TEXT_MARGIN_BOTTOM: number = 1;
  static readonly RefreshLayout_TEXT_MARGIN_LEFT: number = 7;
  static readonly RefreshLayout_TEXT_FONT_SIZE: number = 17;
  static readonly RefreshLayout_IMAGE_WIDTH: number = 18;
  static readonly RefreshLayout_IMAGE_HEIGHT: number = 18;
}

export const enum ContentType {
  JSON = 'application/json'
}