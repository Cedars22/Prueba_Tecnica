import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final Widget placeholder;
  final Widget errorWidget;

  const CachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.placeholder = const Image(image: AssetImage('assets/no-image.png')),
    this.errorWidget = const Icon(Icons.error),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => errorWidget,
    );
  }
}
