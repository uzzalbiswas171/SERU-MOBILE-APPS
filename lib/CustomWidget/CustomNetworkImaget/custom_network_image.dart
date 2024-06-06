import 'package:seru_test_project/custom_const.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatefulWidget {
  final String image;
  double height;
 CustomNetworkImage({super.key, required this.image ,required this.height});

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$BaseUrl/" + widget.image,fit: BoxFit.fill,height: widget.height,
      errorBuilder: (context, widget, _) {
        return Image.network('https://greenmartbd.net/images/default.jpg',fit: BoxFit.fill,);
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
