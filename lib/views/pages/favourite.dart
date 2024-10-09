import 'package:bookstore/views/widget/favourite_card.dart';
import 'package:bookstore/views/widget/search_bar.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
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
       body: ListView(
         children: [
          CustomSearchBar(),
           FavouriteCard(),
           FavouriteCard(),

       ]),

    );
  }
}
