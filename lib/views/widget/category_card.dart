import 'package:bookstore/views/pages/description.dart';
import 'package:flutter/material.dart';

import '../../model/book.dart';

class CategoryCard extends StatelessWidget {
  final Book book;

  const CategoryCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Description(
                book: book,
                onFavoriteToggle: () {} )));
      },
      child: Stack(children: [
        Expanded(
          child: Container(
            margin:const  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                 BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              color: const Color(0xFFF2D9BB),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(
              book.thumbnail,
              height: 150,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF17212C),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Author: ${book.authors}',
                  style:const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF454D56),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Rate: 4.5',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF454D56),
                  ),
                )
              ],
            ),
          ))
        ])
      ]),
    );
  }
}
