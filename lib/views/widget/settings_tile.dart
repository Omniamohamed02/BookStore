import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SettingsTile({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    return ListTile(
      title: Text(title,style:TextStyle(color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)) ,),
      leading: Icon(icon, color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}