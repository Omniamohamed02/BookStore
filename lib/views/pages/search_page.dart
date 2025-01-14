import 'package:bookstore/service/book_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../model/book.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import 'category.dart';

class SearchCategories extends StatefulWidget {
  final List<String> categories = [
    "Science",
    "History",
    "Technology",
    "Art",
    "Business",
    "Romance",
    "Horror",
    "Crime"
  ];

  SearchCategories({super.key});

  @override
  _SearchCategoriesState createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  TextEditingController searchController = TextEditingController();
  List<String> suggestions = [];
  Map<String, List<Book>>? allBooks;

  @override
  void initState() {
    super.initState();
    fetchBooksFromCategories();
  }

  Future<void> fetchBooksFromCategories() async {
    try {
      BookService bookService = BookService();
      allBooks = await bookService.fetchBooksFromCategories();
      setState(() {});
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  List<Book> getBooksByCategory(String category) {
    if (allBooks == null || !allBooks!.containsKey(category)) return [];
    return allBooks![category]!;
  }

  void filterSuggestions(String query) {
    List<String> matches = [];
    if (query.isNotEmpty) {
      matches.addAll(widget.categories.where((category) => category.toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {
      suggestions = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final localizations = S.of(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        title: Text(localizations.SearchCategory),
      ),
      body: allBooks == null
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: themeProvider.isDarkMode ? const Color(0xFF4F5B61) : Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8, color: Color(0xFF17212C)),
                ),
                hintText: localizations.searchForaCategory,
                prefixIcon: Icon(Icons.search, size: 30,  color:themeProvider.isDarkMode? Colors.white : const Color(0xFF17212C)),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      suggestions = [];
                    });
                  },
                  icon:  Icon(Icons.clear,color:themeProvider.isDarkMode? Colors.white :const Color(0xFF17212C)),
                ),
              ),
              onChanged: (value) {
                filterSuggestions(value);
              },
            ),
          ),
          Expanded(
            child: suggestions.isNotEmpty && searchController.text.isNotEmpty
                ? ListView.separated(
              itemCount: suggestions.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestions[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          books: getBooksByCategory(suggestions[index]),
                          category: suggestions[index],
                        ),
                      ),
                    );
                  },
                );
              },
            )
                : ListView.separated(
              itemCount: widget.categories.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.categories[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(
                          books: getBooksByCategory(widget.categories[index]),
                          category: widget.categories[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
