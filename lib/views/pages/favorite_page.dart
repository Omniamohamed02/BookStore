import 'package:bookstore/model/book.dart';
import 'package:bookstore/providers/favorite_provider.dart';
import 'package:bookstore/views/widget/favourite_card.dart';
import 'package:bookstore/views/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';

class FavouritePage extends StatefulWidget {


  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = S.of(context);
    return Consumer<FavoriteProvider>(
        builder: (context,Favorite,child){
          return Scaffold(
              backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
            appBar: AppBar(

              backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
              title: Center(
                  child: Text(
                    '${localizations.favouritebooks}',
                    style: TextStyle(
                      fontSize: 28,
                      color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C),
                    ),
                  )),
            ),
            body: ListView.builder(
                      itemCount:Favorite.FavBooks.length ,
                      itemBuilder: (context,index){
                        return FavouriteCard(book:Favorite.FavBooks[index],remove:(){Favorite.removeFav(Favorite.FavBooks[index]);},);
                      })



          );
        });
  }
}
