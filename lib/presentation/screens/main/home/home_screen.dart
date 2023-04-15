import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/theme/app_colors.dart';
import 'package:meman/presentation/screens/main/home/events/events_view.dart';
import 'package:meman/presentation/screens/main/home/places/places_view.dart';

class HomeScreen extends HookWidget {
  static const id = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TabBar(
              tabs: [
                Tab(child: Text("Upcoming Events")),
                Tab(child: Text("Places to Visit")),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              children: [
                EventsView(),
                PlacesView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
