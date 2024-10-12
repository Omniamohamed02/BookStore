import 'package:flutter/material.dart';
import '../../model/book.dart';
import 'package:bookstore/views/pages/category.dart';
import 'package:bookstore/views/pages/description.dart';

class CustomSearchPage extends StatefulWidget {
  final List<Book> book;
  final List<String> categories = [
    "science",
    "history",
    "technology",
    "art",
    "business",
    "romance",
    "horror",
    "crime"
  ];

  CustomSearchPage({super.key, required this.book});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchPage> {
  TextEditingController searchController = TextEditingController();
  List<String> suggestions = [];
  List<Book>? books;

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  void loadBooks() async {
    books = (await widget.book) as List<Book>?;
    setState(() {});
  }

  void filterSuggestions(String query) {
    List<String> matches = [];
    if (query.isNotEmpty && books != null) {
      matches.addAll(widget.categories.where(
              (category) =>
              category.toLowerCase().contains(query.toLowerCase())));
      matches.addAll(books!
          .map((book) => book.title)
          .where((title) => title.toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {
      suggestions = matches;
    });
  }

  void navigateToCategory(String category) {

    List<Book> filteredBooks = books!.where((book) => book.category == category).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(category: category, books: [],),
      ),
    );
  }

  void navigateToBookDescription(String bookTitle) {
    Book? selectedBook = books!.firstWhere(
          (book) => book.title == bookTitle,
      orElse: () =>
          Book(
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
        builder: (context) =>
            Description(book: selectedBook,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF17212C),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                      const BorderSide(width: 0.8, color: Color(0xFF17212C)),
                    ),
                    hintText: 'Search for a Book or Category',
                    prefixIcon: const Icon(Icons.search,
                        size: 30, color: Color(0xFF17212C)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        setState(() {
                          suggestions = [];
                        });
                      },
                      icon: const Icon(Icons.clear, color: Color(0xFF17212C)),
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
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.grey),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(suggestions[index]),
                        onTap: () {

                          if (widget.categories.contains(suggestions[index])) {

                            navigateToCategory(suggestions[index]);
                          } else {

                            navigateToBookDescription(suggestions[index]);
                          }
                        },
                      );
                    },
                  ),
                )
                    : Container(),
              )
            ]));
  }}