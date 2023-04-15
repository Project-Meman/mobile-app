import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/theme/app_colors.dart';

class HomeScreen extends HookWidget {
  static const id = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.black,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(child: Text("Upcoming Events")),
                Tab(child: Text("Places to Visit")),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Text("Coming up"),
                  Text("Places"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
