import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/providers/language_provider.dart';
import 'package:bookstore/providers/theme_provider.dart';
import 'package:bookstore/service/auth_service.dart';
import 'package:bookstore/views/pages/pro_screen.dart';
import 'package:bookstore/views/widget/settings_section.dart';
import 'package:bookstore/views/widget/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/dark_mode.dart';

class SettingsPage extends StatelessWidget {

  final authService =AuthService();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = S.of(context); // Access localized strings


    return  Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        title: Text(
          localizations.settings,  // Use localized settings title in AppBar
          style: TextStyle(color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C),fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        iconTheme: IconThemeData(color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35.0),
            Container(
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Colors.grey[500] : Colors.grey[200],
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingsSection(
                    title: localizations.general,
                    tiles: [
                      SettingsTile(
                        title: localizations.profile,
                        icon: Icons.person_outline,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 35.0),
            Container(
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Colors.grey[500] : Colors.grey[200],
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingsSection(
                    title: localizations.settings,
                    tiles: [
                      SettingsTile(
                        title: localizations.language,
                        icon: Icons.language_outlined,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  localizations.select_language,
                                  style: TextStyle(
                                      color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C)),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: Text(localizations.english),
                                      onTap: () {
                                        languageProvider.setLocale(Locale('en'));
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: Text(localizations.arabic),
                                      onTap: () {
                                        languageProvider.setLocale(Locale('ar'));
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SettingsTile(
                        title: localizations.dark_mode,
                        icon: Icons.nightlight_round_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SwitchWidget()),
                          );
                        },
                      ),
                      SettingsTile(
                        title: localizations.logout,
                        icon: Icons.logout,
                        onTap: () {authService.logout();},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
