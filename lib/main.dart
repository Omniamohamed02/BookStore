import 'package:bookstore/firebase_options.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/providers/cart_provider.dart';
import 'package:bookstore/providers/favorite_provider.dart';

import 'package:bookstore/providers/theme_provider.dart';
import 'package:bookstore/views/pages/auth.dart';
import 'package:bookstore/views/widget/navagationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'cubit/book_cubit.dart';
import 'providers/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer4<ThemesProvider, CartProvider, FavoriteProvider, LanguageProvider>(
        builder: (context, themeProvider, cart, favorite, languageProvider, child) {
          return MaterialApp(
            theme: themeProvider.currentTheme,
            locale: languageProvider.locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
            ],
            home: Auth(),
          );
        },
      ),
    );
  }
}
