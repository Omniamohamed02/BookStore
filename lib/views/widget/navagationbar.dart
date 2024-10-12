import 'package:bookstore/views/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import '../pages/favorite_page.dart';
import '../pages/settings.dart';

class BottomNavBar extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = S.of(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
              () => NavigationBar(
                backgroundColor:themeProvider.isDarkMode ? Color(0xFF4F5B61) : Color(0xFFF2D9BB),
            elevation: 2,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
            controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: '${localizations.home}',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmarks),
                label: '${localizations.favorite}',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: '${localizations.settings}',
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
     SettingsPage(),
  ];
}
