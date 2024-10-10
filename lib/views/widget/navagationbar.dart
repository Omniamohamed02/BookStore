import 'package:bookstore/views/pages/favorite_page.dart';
import 'package:bookstore/views/pages/home.dart';
import 'package:bookstore/views/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            backgroundColor: Color(0xFFF2D9BB),
            elevation: 2,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(
                    Icons.home,
                    color: Color(0xFF17212C),
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.bookmarks),
                  selectedIcon: Icon(
                    Icons.bookmarks,
                    color: Color(0xFF17212C),
                  ),
                  label: 'Favourite'),
              NavigationDestination(
                  icon: Icon(Icons.settings),
                  selectedIcon: Icon(
                    Icons.settings,
                    color: Color(0xFF17212C),
                  ),
                  label: 'Settings'),
            ],
          ),
        ),

      body: Obx(() => controller.pages[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final List<Widget> pages = [
    const HomePage(),
    FavouritePage(),
    const SettingsPage(),
  ];
}
