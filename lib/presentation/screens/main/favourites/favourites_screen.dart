import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/res/app_colors.dart';

class FavouritesScreen extends HookWidget {
  static const id = "/favourites";

  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
      ),
      body: const Text("Favourites"),
    );
  }
}
