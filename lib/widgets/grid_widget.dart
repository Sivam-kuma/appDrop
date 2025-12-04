import 'package:flutter/material.dart';
import '../models/grid_model.dart';

class GridWidget extends StatelessWidget {
  final GridModel model;
  const GridWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(model.padding),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: model.columns,
        crossAxisSpacing: model.spacing,
        mainAxisSpacing: model.spacing,
        children: model.images.map((img) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              img,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
