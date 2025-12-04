import 'dart:async';
import 'package:flutter/material.dart';
import '../models/carousel_model.dart';

class CarouselWidget extends StatefulWidget {
  final CarouselModel model;

  const CarouselWidget({super.key, required this.model});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int currentPage = 0;
  late PageController controller;
  Timer? autoPlayTimer;

  @override
  void initState() {
    super.initState();

    controller = PageController();

    if (widget.model.autoPlay) {
      autoPlayTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
        if (!mounted) return;

        int nextPage = controller.page!.toInt() + 1;

        if (nextPage == widget.model.images.length) {
          nextPage = 0;
        }

        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    autoPlayTimer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.model.padding),
      child: SizedBox(
        height: widget.model.height,
        child: Column(
          children: [
            SizedBox(
              height: widget.model.height - 20,
              child: PageView(
                controller: controller,
                onPageChanged: (i) {
                  setState(() {
                    currentPage = i;
                  });
                },
                children: widget.model.images.map((img) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.model.padding + 20,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        img,
                        fit: BoxFit.cover,
                        loadingBuilder:
                            (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.model.images.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == currentPage ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                      i == currentPage ? Colors.white : Colors.white30,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
