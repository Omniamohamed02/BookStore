import 'package:bookstore/views/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/book.dart';
import '../../providers/theme_provider.dart';
import '../widget/search_bar.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Book> books;

  const CategoryPage({super.key, required this.category, required this.books});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        title: Text(category),
      ),
      body: Column(
        children: [
           CustomSearchBar(),
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
