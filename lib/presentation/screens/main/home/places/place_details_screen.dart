import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlaceDetailsScreen extends HookWidget {
  static const id = "/places_details";

  const PlaceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Places Details");
  }
}
