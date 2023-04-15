import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GradientImage extends HookWidget {
  final ImageProvider image;
  final double? width;
  final double? height;
  final BoxShape shape;
  final BoxFit boxFit;
  final Widget? content;

  const GradientImage({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.boxFit = BoxFit.cover,
    this.content,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: shape,
            color: Colors.transparent,
            image: DecorationImage(fit: boxFit, image: image),
          ),
          height: height ?? size.height / 1.5,
          width: width,
        ),
        Container(
          height: height ?? size.height / 1.5,
          width: width,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.3),
                Colors.transparent,
              ],
            ),
          ),
          child: content,
        ),
      ],
    );
  }
}
