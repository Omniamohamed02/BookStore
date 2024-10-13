import 'package:bookstore/views/pages/searchcategory.dart';
import 'package:bookstore/views/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../model/book.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Book> books;

  const CategoryPage({super.key, required this.category, required this.books});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = S.of(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        title: Text(category),
        actions: [
          IconButton(onPressed: (){
               Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) => SearchBooksInCategory(books: books, category: category),
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
