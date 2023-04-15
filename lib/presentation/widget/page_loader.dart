import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PageLoader extends HookWidget {
  const PageLoader({Key? key, this.width = 2}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformCircularProgressIndicator(
        material: (_, __) => MaterialProgressIndicatorData(strokeWidth: width),
      ),
    );
  }
}
