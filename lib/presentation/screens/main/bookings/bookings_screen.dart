import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/theme/app_colors.dart';

class BookingsScreen extends HookWidget {
  static const id = "/bookings";

  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
      ),
      body: const Text("Bookings"),
    );
  }
}
