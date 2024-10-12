import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    return Container(
      color: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0.8,
              color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C),
            ),
          ),
          hintText: 'Search for a Book',
          hintStyle: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white60 : Colors.grey,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.clear,
              color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C),
            ),
          ),
        ),
      ),
    );
  }
}
