import 'package:bookstore/views/pages/search_page.dart';
import 'package:bookstore/views/widget/category_card.dart';
import 'package:flutter/material.dart';
import '../../model/book.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Book> books;

  const CategoryPage({super.key, required this.category, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(category),
        actions: [
          IconButton(onPressed: (){
               Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) => CustomSearchPage(book: books),
                      ),
    );}, icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
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
