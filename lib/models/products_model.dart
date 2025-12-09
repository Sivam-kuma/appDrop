class Products{
  final String type;
  final String value;
  final List<About> product;

  Products({
    required this.value,
    required this.product,
    required this.type,
});
    factory Products.fromJson(Map<String , dynamic> json){
      return Products(
      type : json["type"],
      value:json["value"],
        product:(json["products"] as List) .map((e)=> About.fromJson(e)).toList(),
      );

    }
}

class About {
  final String name;
  final String image;
  final double price;
  final String description;
  final double rate;

  About({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rate,
});
  factory About.fromJson(Map<String , dynamic> json){
    return About(
      name:json["name"],
      image:json["image"],
      price:json["price"].toDouble(),
      description:json["description"],
      rate:json["rate"].toDouble(),
    );
  }
}