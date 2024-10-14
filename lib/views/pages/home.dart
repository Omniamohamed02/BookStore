import 'package:bookstore/views/pages/cart_page.dart';
import 'package:bookstore/views/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/views/widget/catogrey_title.dart';
import 'package:bookstore/model/book.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import '../../service/book_service.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key,});



  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = S.of(context);
    return Scaffold(
        backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        leading: IconButton(onPressed: (){ Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchCategories()
          ),
        );}, icon: Icon(Icons.search)),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>CartPage()));
           }, icon: Icon(Icons.shopping_cart,)),

           ]),

      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10.0, bottom: 10, left: 10.0),
          child: Column(
            children: [
              Text(
              '${localizations.homeappbar}',
              style: TextStyle(fontSize: 20, color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)),
            ),
              Text(
                '${localizations.homeappbar1}',
                style: TextStyle(fontSize: 20,color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)),),
              Expanded(
                child: FutureBuilder<Map<String, List<Book>>>(
                  future: BookService().fetchBooksFromCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color:Color(0xFFF2D9BB) ,));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No books found'));
                    } else {
                      final booksByCategory = snapshot.data!;
                      return ListView(
                        children: booksByCategory.entries.map((entry) {
                          String category = entry.key;
                          List<Book> books = entry.value.take(20).toList();
          
          
                          return CatogreyTitle(
                            category: category,
                            books: books,
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),

    );
  }
}
