class VideoModel {
  final String url;
  final bool autoPlay;
  final bool loop;
  final double height;
  final double padding;

  VideoModel({
    required this.url,
    required this.autoPlay,
    required this.loop,
    required this.height,
    required this.padding,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      url: json["url"] ?? "",
      autoPlay: json["autoPlay"] ?? false,
      loop: json["loop"] ?? false,
      height: (json["height"] ?? 200).toDouble(),
      padding: (json["padding"] ?? 12).toDouble(),
    );
  }
}