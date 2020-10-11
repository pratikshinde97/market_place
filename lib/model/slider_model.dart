class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Allow miles wound place the leave had. To sitting subject no improve studied limited");
  sliderModel.setTitle("");
  sliderModel.setImageAssetPath("Images/image2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Allow miles wound place the leave had. To sitting subject no improve studied limited");
  sliderModel.setTitle("");
  sliderModel.setImageAssetPath("Images/image2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  sliderModel.setTitle("");
  sliderModel.setImageAssetPath("Images/image2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc(
      "Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  sliderModel.setTitle("");
  sliderModel.setImageAssetPath("Images/image2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
