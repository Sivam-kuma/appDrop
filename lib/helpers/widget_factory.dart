import 'package:flutter/material.dart';
import '../models/banner_model.dart';
import '../models/carousel_model.dart';
import '../models/grid_model.dart';
import '../models/products_model.dart';
import '../models/text_model.dart';
import '../models/video_model.dart';
import '../widgets/banner_widget.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/grid_widget.dart';
import '../widgets/products.dart';
import '../widgets/video_widget.dart';
import '../widgets/text_widget.dart';

class WidgetFactory {
  static Widget build(dynamic comp) {
    if (comp is BannerModel) {
      return BannerWidget(model: comp);
    } else if (comp is CarouselModel) {
      return CarouselWidget(model: comp);
    } else if (comp is GridModel) {
      return GridWidget(model: comp);
    }
    else if(comp is Products){
      return Product(model: comp);
    }
    else if (comp is VideoModel) {
      return VideoWidget(model: comp);
    } else if (comp is TextModel) {
      return TextWidget(model: comp);
    }
    return SizedBox();
  }
}
