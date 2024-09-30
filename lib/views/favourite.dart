import 'package:bookstore/views/favourite_card.dart';
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
           Container(
             margin: EdgeInsets.all(10.0),
             child: TextField(
               decoration: InputDecoration(
                   filled: true,
                   fillColor: Color(0xFFF2D9BB),
                   contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30.0),
                     borderSide: BorderSide(width: 0.8,color: Color(0xFF17212C)),
                   ),
                   hintText: 'Search for a Book',
                   prefixIcon: Icon(Icons.search,size: 30,color: Color(0xFF17212C),),
                   suffixIcon: IconButton(onPressed: (){},
                       icon: Icon(Icons.clear,color: Color(0xFF17212C),))

               ),
             ),
           ),
           FavouriteCard(),
           FavouriteCard(),

       ]),

    );
  }
}
