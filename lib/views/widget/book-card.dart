import 'package:bookstore/views/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Description(
          book: book,
          onFavoriteToggle: () {} )));
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
                Text(book.title.length > 20
                    ? '${book.title.substring(0, 20)}...'
                    : book.title, style: const TextStyle(
                  color: Color(0xFF17212C),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
                 ),
                   Text(book.authors.length > 20
                       ? '${book.authors.substring(0, 20)}...'
                       : book.authors,
              style: const TextStyle(color: Color(0xFF454D56), fontSize: 12,),)
                ],
              )
      
      
      
            ],
        ),
      ),
    );
  }
}
