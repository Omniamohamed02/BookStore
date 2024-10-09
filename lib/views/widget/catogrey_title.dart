import 'package:flutter/material.dart';
import '../../model/book.dart';
import '../pages/category.dart';
import 'book-card.dart';

class CatogreyTitle extends StatelessWidget {
  final List<Book> books;
  final String category;

  const CatogreyTitle({super.key, required this.books, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryPage(category: category, books: books),
                    ));
              },
              child:
              const Text('See more', style: TextStyle(color: Color(0xFF17212C))),
            ),
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length ,
            itemBuilder: (context, index) {
              return BookCard(book: books[index]);
            },
          ),
        ),
      ],
    );
  }
}
