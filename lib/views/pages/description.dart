import 'package:bookstore/model/book.dart';
import 'package:bookstore/providers/cart_provider.dart';
import 'package:bookstore/providers/favorite_provider.dart';
import 'package:bookstore/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../providers/language_provider.dart';

class Description extends StatefulWidget {
  final Book book;


  const Description({super.key, required this.book,});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = S.of(context);

    return Consumer3<CartProvider,FavoriteProvider,ThemesProvider>(
        builder: (context,Cart ,Favourite,theme,child){
          return Scaffold(
            backgroundColor: theme.isDarkMode ? Color(0xFF303E44) : Colors.white,
            appBar: AppBar(
              title: Text(widget.book.title,),
              centerTitle: true,
              backgroundColor:theme.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
              actions: [
                IconButton(onPressed: (){
                  Favourite.addFav(widget.book);
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text(
                          '${localizations.addedToFav}')));
                }, icon: Icon(Icons.favorite,color: Colors.red,))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section

                    SizedBox(height: 20),

                    // Book Image
                    Center(
                      child: Container(
                        width: 200,
                        height: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(widget.book.thumbnail), // Updated to use book.thumbnail
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Information Section
                    Text.rich(
                      TextSpan(
                        text: "${localizations.bookTitel}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.title}", // Updated to use book.title
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:theme.isDarkMode? Colors.white : Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    Text.rich(
                      TextSpan(
                        text: "${localizations.category}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.category}", // Updated to use book.category
                            style: TextStyle(fontSize: 18, color:theme.isDarkMode? Colors.white : Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Description
                    Text.rich(
                      TextSpan(
                        text: "${localizations.description}",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.description}", // Updated to use book.pageCount
                            style: TextStyle(color:theme.isDarkMode? Colors.white : Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Other Details
                    Text.rich(
                      TextSpan(
                        text: "${localizations.author}",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.authors}", // Updated to use book.authors
                            style: TextStyle(color:theme.isDarkMode? Colors.white : Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "${localizations.publishDate} ",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.publishedDate}", // Updated to use book.publishedDate
                            style: TextStyle(color:theme.isDarkMode? Colors.white : Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "${localizations.pages} ",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.pageCount}", // Updated to use book.pageCount
                            style: TextStyle(color:theme.isDarkMode? Colors.white : Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Cart.add(widget.book);
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                  content: Text(
                                      '${localizations.addedTCart}')));

                            },
                            child: Text('${localizations.atc}', style: TextStyle(fontSize: 20, color:theme.isDarkMode? Color(0xFF17212C) : Colors.white)),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              minimumSize: Size(100, 40),
                              backgroundColor: Color(0xFFCCB08F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}