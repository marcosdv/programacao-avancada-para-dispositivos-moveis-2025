import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagemWeb extends StatelessWidget {
  final String link;
  final double? h;
  final double? w;

  const ImagemWeb({
    required this.link,
    this.h,
    this.w,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: link,
      height: h,
      width: w,
    );
  }
}