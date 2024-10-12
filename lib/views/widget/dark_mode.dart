import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);


    final localizations = S.of(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(12),
              color: themeProvider.isDarkMode ? Colors.grey[800] : Colors.white.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [

                    Text(
                      localizations.dark_mode,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
