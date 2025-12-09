class BannerModel {
  final String image;
  final double height;
  final double padding;
  final double elevation;
  final double radius;


  BannerModel({
    required this.image,
    required this.height,
    required this.padding,
    required this.elevation,
    required this.radius,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      elevation:json["elevation"].toDouble(),
      radius: json["radius"].toDouble(),
      image: json["image"],
      height: (json["height"] ?? 150).toDouble(),
      padding: (json["padding"] ?? 16).toDouble(),
    );
  }
}
