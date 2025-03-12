enum SampulData {
  bunny(image: "assets/images/Frame 1.png", quotes: ""),
  simple(image: "assets/images/Frame 2.png", quotes: ""),
  orangeCat(image: "assets/images/Frame 3.png", quotes: ""),
  threeCat(image: "assets/images/Frame 4.png", quotes: ""),
  fourCat(image: "assets/images/Frame 5.png", quotes: ""),
  oneCat(image: "assets/images/Frame 6.png", quotes: ""),
  ;

  final String image;
  final String quotes;
  const SampulData({required this.image, required this.quotes});
}
