import 'package:bookstore/views/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../../model/book.dart';
import '../../providers/theme_provider.dart';

class SearchBooksInCategory extends StatefulWidget {
  final List<Book> books;
  final String category;

  SearchBooksInCategory({
    super.key,
    required this.books,
    required this.category,
  });

  @override
  _SearchBooksInCategoryState createState() => _SearchBooksInCategoryState();
}

class _SearchBooksInCategoryState extends State<SearchBooksInCategory> {
  TextEditingController searchController = TextEditingController();
  List<String> suggestions = [];
  List<Book>? filteredBooks;

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  void loadBooks() {
    filteredBooks = widget.books.where((book) => book.category == widget.category).toList();
  }

  void filterSuggestions(String query) {
    List<String> matches = [];
    if (query.isNotEmpty && filteredBooks != null) {
      matches.addAll(filteredBooks!
          .map((book) => book.title)
          .where((title) => title.toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {
      suggestions = matches;
    });
  }

  void navigateToBookDescription(String bookTitle) {
    Book? selectedBook = filteredBooks!.firstWhere(
          (book) => book.title == bookTitle,
      orElse: () => Book(
        title: 'Unknown',
        authors: 'Unknown',
        thumbnail: '',
        pageCount: 0,
        publishedDate: '',
        description: '',
        category: '',
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Description(book: selectedBook),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final localizations = S.of(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        backgroundColor:themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        title: Text('${localizations.Search} ${widget.category}'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: themeProvider.isDarkMode ? Color(0xFF4F5B61) : Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8, color: Color(0xFF17212C)),
                ),
                hintText: localizations.searchForaBook,
                prefixIcon:  Icon(Icons.search, size: 30, color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C) ),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      suggestions = [];
                    });
                  },
                  icon:  Icon(Icons.clear, color: themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)),
                ),
              ),
              onChanged: (value) {
                filterSuggestions(value);
              },
            ),

          ),
          Expanded(
            child: suggestions.isNotEmpty
                ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.separated(
                itemCount: suggestions.length,
                separatorBuilder: (context, index) => Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(suggestions[index]),
                    onTap: () {
                      navigateToBookDescription(suggestions[index]);
                    },
                  );
                },
              ),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}
