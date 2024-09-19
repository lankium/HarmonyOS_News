import NewsTypeModel from './NewsTypeModel';

export default class ResponseResult {
  code: string;
  msg: string | Resource
  data: NewsTypeModel[] | string | Object | ArrayBuffer

  constructor() {
    this.code = ''
    this.msg = ''
    this.data = ''
  }
}