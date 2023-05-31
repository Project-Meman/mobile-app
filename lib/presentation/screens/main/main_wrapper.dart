import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:meman/core/utils/res/app_colors.dart';
import 'package:meman/presentation/screens/main/bookings/bookings_screen.dart';
import 'package:meman/presentation/screens/main/home/home_screen.dart';
import 'package:meman/presentation/screens/main/profile/profile_screen.dart';
import 'package:meman/presentation/screens/main/search/search_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainWrapper extends HookWidget {
  static const id = "/main";

  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    return Scaffold(
      appBar: currentIndex.value == 0
          ? null
          : AppBar(
              elevation: 0,
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              title: Text("${BottomNavItem.items[currentIndex.value].label}"),
            ),
      body: PageView.builder(
        itemCount: BottomNavItem.items.length,
        itemBuilder: (ctx, idx) => BottomNavItem.items[currentIndex.value].page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => currentIndex.value = index,
        backgroundColor: Colors.white,
        currentIndex: currentIndex.value,
        unselectedItemColor: AppColors.muted,
        selectedItemColor: AppColors.primaryDark,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        // showUnselectedLabels: false,
        // showSelectedLabels: false,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        items: BottomNavItem.items.map(
          (BottomNavItem navItem) {
            return BottomNavigationBarItem(
              icon: Icon(navItem.icon).marginOnly(bottom: 4),
              tooltip: navItem.label,
              label: navItem.label,
            );
          },
        ).toList(),
      ),
    );
  }
}

class BottomNavItem {
  final String? label;
  final IconData icon;
  final Widget page;

  const BottomNavItem({
    this.label,
    required this.icon,
    required this.page,
  });

  static List<BottomNavItem> get items => [
        const BottomNavItem(
          icon: PhosphorIcons.compassFill,
          page: HomeScreen(),
          label: "Explore",
        ),
        const BottomNavItem(
          icon: PhosphorIcons.calendarCheckFill,
          page: SearchScreen(),
          label: "Upcoming",
        ),
        const BottomNavItem(
          icon: PhosphorIcons.mapTrifoldFill,
          page: BookingsScreen(),
          label: "Trips",
        ),
        const BottomNavItem(
          icon: PhosphorIcons.userCircleFill,
          page: ProfileScreen(),
          label: "Profile",
        ),
      ];
}
