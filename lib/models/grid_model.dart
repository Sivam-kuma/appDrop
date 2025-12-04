class GridModel {
  final List<String> images;
  final int columns;
  final double spacing;
  final double padding;

  GridModel({
    required this.images,
    required this.columns,
    required this.spacing,
    required this.padding,
  });

  factory GridModel.fromJson(Map<String, dynamic> json) {
    return GridModel(
      images: List<String>.from(json["images"] ?? []),
      columns: json["columns"] ?? 2,
      spacing: (json["spacing"] ?? 8).toDouble(),
      padding: (json["padding"] ?? 16).toDouble(),
    );
  }
}