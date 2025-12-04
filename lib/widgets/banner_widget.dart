import 'package:flutter/material.dart';
import '../models/banner_model.dart';

class BannerWidget extends StatelessWidget {
  final BannerModel model;
  const BannerWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(model.padding),
      color: Colors.black.withValues(alpha: 0.15),
      child: Padding(
        padding: EdgeInsets.all(model.padding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Image.network(
            model.image,
            height: model.height,
            width: double.infinity,
            fit: BoxFit.cover,

            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                height: model.height,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
