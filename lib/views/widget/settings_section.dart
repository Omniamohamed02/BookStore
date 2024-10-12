import 'dart:ui';

import 'package:bookstore/views/widget/settings_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';


class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsTile> tiles;

  SettingsSection({required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C),
            ),
          ),
          ...tiles,
        ],
      ),
    );
  }
}