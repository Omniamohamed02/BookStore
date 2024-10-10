import 'package:bookstore/model/book.dart';
import 'package:bookstore/model/favorite.dart';
import 'package:bookstore/views/widget/favourite_card.dart';
import 'package:bookstore/views/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {


  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Favorite>(
        builder: (context,Favorite,child){
          return Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                    'Favourite Books',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF17212C),
                    ),
                  )),
            ),
            body: ListView.builder(
                      itemCount:Favorite.FavBooks.length ,
                      itemBuilder: (context,index){
                        return FavouriteCard(book:Favorite.FavBooks[index],remove:(){Favorite.FavBooks[index];},);
                      })



          );
        });
  }
}
