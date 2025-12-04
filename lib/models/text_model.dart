class TextModel {
  final String value;
  final double size;
  final String align;
  final String weight;
  final double padding;

  TextModel({
    required this.value,
    required this.size,
    required this.align,
    required this.weight,
    required this.padding,
  });

  factory TextModel.fromJson(Map<String, dynamic> json) {
    return TextModel(
      value: json["value"] ?? "",
      size: (json["size"] ?? 16).toDouble(),
      align: json["align"] ?? "left",
      weight: json["weight"] ?? "normal",
      padding: (json["padding"] ?? 10).toDouble(),
    );
  }
}