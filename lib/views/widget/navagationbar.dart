import 'package:bookstore/views/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../pages/favorite_page.dart';
import '../pages/settings.dart';

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
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmarks),
                label: 'Favourite',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
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
