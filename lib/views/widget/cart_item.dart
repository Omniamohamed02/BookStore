import 'package:bookstore/model/book.dart';
import 'package:bookstore/views/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class CartItem extends StatelessWidget {
  final Book book;
  var remove;
   CartItem({super.key, required this.book,required this.remove});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    return Stack(
        children: [

        Expanded(
          child: Container(

            margin:const  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,

                ),
              ],
              color: themeProvider.isDarkMode ? Color(0xFF4F5B61) : Color(0xFFF2D9BB),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                child: Image.network(
                  book.thumbnail,
                  height: 100,
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       Align(
                         alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.delete, ),
                            onPressed: remove
                          ),
                        ),
                        Text(
                          book.title,
                          style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                              color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Author: ${book.authors}',
                          style:TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                              color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Rate: 4.5',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                              color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)
                          ),
                        ),

                      ],
                    ),
                  ))
            ])
      ]);

  }
}

