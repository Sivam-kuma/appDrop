import 'package:flutter/material.dart';

import '../models/text_model.dart';


class TextWidget extends StatelessWidget {
  final TextModel model;
  const TextWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(model.padding),
      child: Text(
        model.value,
        textAlign: model.align == "center"
            ? TextAlign.center
            : model.align == "right"
            ? TextAlign.right
            : TextAlign.left,
        style: TextStyle(
          fontSize: model.size,
          fontWeight: model.weight == "bold" ? FontWeight.bold : FontWeight.normal,
          color: Colors.grey,
        ),
      ),
    );
  }
}
