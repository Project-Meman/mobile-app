import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/theme/app_colors.dart';
import 'package:meman/presentation/screens/main/bookings/bookings_screen.dart';
import 'package:meman/presentation/screens/main/favourites/favourites_screen.dart';
import 'package:meman/presentation/screens/main/home/home_screen.dart';
import 'package:meman/presentation/screens/main/profile/profile_screen.dart';
import 'package:meman/presentation/screens/main/search/search_screen.dart';

class MainWrapper extends HookWidget {
  static const id = "/main";

  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    return Scaffold(
      appBar: currentIndex.value == 0
          ? homeAppBar()
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
            ),
      body: PageView.builder(
        itemCount: BottomNavItem.items.length,
        itemBuilder: (ctx, idx) => BottomNavItem.items[currentIndex.value].page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => currentIndex.value = index,
        currentIndex: currentIndex.value,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: BottomNavItem.items
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }

  PreferredSizeWidget homeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(FontAwesome5Solid.map_marker_alt, size: 15),
          SizedBox(width: 5),
          Expanded(child: Text("Accra, Ghana", style: TextStyle(fontSize: 16)))
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(SimpleLineIcons.bell, size: 20,),
          padding: EdgeInsets.only(right: 15),
        )
      ],
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
          icon: SimpleLineIcons.compass,
          page: HomeScreen(),
          label: "Home",
        ),
        const BottomNavItem(
          icon: SimpleLineIcons.magnifier,
          page: SearchScreen(),
          label: "Search",
        ),
        const BottomNavItem(
          icon: SimpleLineIcons.event,
          page: BookingsScreen(),
          label: "Bookings",
        ),
        const BottomNavItem(
          icon: SimpleLineIcons.heart,
          page: FavouritesScreen(),
          label: "Favourite",
        ),
        const BottomNavItem(
          icon: SimpleLineIcons.user,
          page: ProfileScreen(),
          label: "Profile",
        ),
      ];
}
