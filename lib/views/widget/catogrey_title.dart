import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../model/book.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import '../pages/category.dart';
import 'book-card.dart';

class CatogreyTitle extends StatelessWidget {
  final List<Book> books;
  final String category;

  const CatogreyTitle({super.key, required this.books, required this.category});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = S.of(context);
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
              Text('${localizations.seemore}', style: TextStyle( color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C),)),
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
