import 'package:bookstore/service/auth_service.dart';
import 'package:bookstore/views/pages/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';


class ProScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    User? user;
      user = FirebaseAuth.instance.currentUser!;

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        final localizations = S.of(context);

        return Scaffold(
          backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
          appBar: AppBar(
            backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${user?.email}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C),
                    ),
                  ),
                  SizedBox(height: 10),


                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85, // Set width to 85% of screen width
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkMode ? Colors.grey[500] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${localizations.language}: ${languageProvider.locale.languageCode.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 16,
                              color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${localizations.profile}: ${user?.email}',
                            style: TextStyle(
                              fontSize: 16,
                              color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${localizations.phone_number}: 00000000000',
                            style: TextStyle(
                              fontSize: 16,
                              color: themeProvider.isDarkMode ? Colors.white : Color(0xFF17212C),
                            ),
                          ),
                          SizedBox(height: 10),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
