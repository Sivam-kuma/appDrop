class CarouselModel {
  final List<String> images;
  final double height;
  final bool autoPlay;
  final double padding;

  CarouselModel({
    required this.images,
    required this.height,
    required this.autoPlay,
    required this.padding,
  });

  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    return CarouselModel(
      images: List<String>.from(json["images"] ?? []),
      height: (json["height"] ?? 180).toDouble(),
      autoPlay: json["autoPlay"] ?? true,
      padding: (json["padding"] ?? 12).toDouble(),
    );
  }
}