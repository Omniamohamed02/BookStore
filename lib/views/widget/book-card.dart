import 'package:bookstore/views/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/book.dart';
import '../../providers/theme_provider.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book,});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Description(
          book: book,
           )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 200,
        child: Column(
          children: [
        Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                 book.thumbnail,
                  ),
              ),
            ),Column(
              mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(book.title.length > 15
                    ? '${book.title.substring(0, 15)}...'
                    : book.title, style: TextStyle(
                    color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
                 ),
                   Text(book.authors.length > 15
                       ? '${book.authors.substring(0, 15)}...'
                       : book.authors,
              style:  TextStyle( color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C), fontSize: 12,),)
                ],
              )
      
      
      
            ],
        ),
      ),
    );
  }
}
