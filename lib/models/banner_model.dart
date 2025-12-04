class BannerModel {
  final String image;
  final double height;
  final double padding;


  BannerModel({
    required this.image,
    required this.height,
    required this.padding,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json["image"],
      height: (json["height"] ?? 150).toDouble(),
      padding: (json["padding"] ?? 16).toDouble(),
    );
  }
}
