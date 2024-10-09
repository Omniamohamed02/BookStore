import 'package:bookstore/views/widget/category_card.dart';
import 'package:flutter/material.dart';
import '../../model/book.dart';
import '../widget/search_bar.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Book> books;

  const CategoryPage({super.key, required this.category, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return CategoryCard(book: books[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
