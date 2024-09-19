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