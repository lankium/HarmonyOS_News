@Observed
export class CustomRefreshLoadLayoutClass {
  isVisible: boolean
  imageSrc: Resource
  textValue: Resource
  heightValue: number

  constructor(isVisible: boolean, imageSrc: Resource, textValue: Resource, heightValue: number) {
    this.isVisible = isVisible
    this.imageSrc = imageSrc
    this.textValue = textValue
    this.heightValue = heightValue
  }
}

/**
 * News list item info.
 */
export class NewsData {
  /**
   * News list item title.
   */
  title: string = '';

  /**
   * News list item content.
   */
  content: string = '';

  /**
   * News list item imagesUrl.
   */
  imagesUrl: Array<NewsFile> = [new NewsFile()];

  /**
   * News list item source.
   */
  source: string = '';
}

/**
 * News image list item info.
 */
export class NewsFile {
  /**
   * News image list item id.
   */
  id: number = 0;

  /**
   * News image list item url.
   */
  url: string = '';

  /**
   * News image list item type.
   */
  type: number = 0;

  /**
   * News image list item newsId.
   */
  newsId: number = 0;
}