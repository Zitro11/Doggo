import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';  //Indicador de abajo

class BuildIndicator extends StatelessWidget {
  const BuildIndicator({
    super.key,
    required this.indexMonumento,
    required this.urlImagesLength,
  });

  final int indexMonumento;
  final int urlImagesLength;

  @override
  Widget build(BuildContext context) => AnimatedSmoothIndicator(
    effect: const ExpandingDotsEffect(
      dotWidth: 15,
      activeDotColor: Colors.blue
    ),
    activeIndex: indexMonumento,
    count: urlImagesLength,
  );
}