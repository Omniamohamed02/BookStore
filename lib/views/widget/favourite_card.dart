import 'package:bookstore/model/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../pages/description.dart';

class FavouriteCard extends StatelessWidget {
  final Book book;
   var remove ;

  FavouriteCard({super.key, required this.book,required this.remove });
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Description(
                      book: book,
                       )));
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Color(0xFF4F5B61) : Color(0xFFF2D9BB),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.network(
                  '${book.thumbnail}',
                  height: 100,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${book.title}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                            color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${book.authors}',
                        style: TextStyle(
                          fontSize: 14,
                            color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)
                        ),
                      ),
                      SizedBox(height: 10),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(onPressed: remove, icon: Icon(Icons.favorite))
              ),
            ],
          ),
        ],
      ),
    );
  }
}
