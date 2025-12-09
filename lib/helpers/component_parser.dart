import '../models/banner_model.dart';
import '../models/carousel_model.dart';
import '../models/grid_model.dart';
import '../models/products_model.dart';
import '../models/text_model.dart';
import '../models/video_model.dart';

class ComponentParser {
  static List<dynamic> parseComponents(List<dynamic> list) {
    List<dynamic> components = [];

    for (var item in list) {
      final type = item["type"];

      if (type == "banner") {
        components.add(BannerModel.fromJson(item));
      } else if (type == "carousel") {
        components.add(CarouselModel.fromJson(item));
      } else if (type == "grid") {
        components.add(GridModel.fromJson(item));
      } else if (type == "video") {
        components.add(VideoModel.fromJson(item));
      } else if(type == "products"){
        components.add(Products.fromJson(item));
      }
      else if (type == "text") {
        components.add(TextModel.fromJson(item));
      }
    }

    return components;
  }
}
