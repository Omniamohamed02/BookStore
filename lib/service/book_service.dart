import 'package:bookstore/model/book.dart';
import 'package:dio/dio.dart';

class BookService {
  final String baseUrl = "https://www.googleapis.com/books/v1/volumes?q=subject:";

  Future<List<Book>> fetchBooks(String category) async {
    try {
      final response = await Dio().get('$baseUrl$category&maxResults=40');
      if (response.statusCode == 200) {
        return (response.data['items'] as List<dynamic>)
            .map((item) => Book.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load books: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }

  Future<Map<String, List<Book>>> fetchBooksFromCategories() async {
    List<String> categories = [
      "Science",
      "History",
      "Technology",
      "Art",
      "Business",
      "Romance",
      "Horror",
      "Crime"
    ];

    Map<String, List<Book>> allBooks = {};

    for (String category in categories) {
      try {
        List<Book> books = await fetchBooks(category);
        allBooks[category] = books;
      } catch (e) {
        print("Failed to fetch books for category $category: $e");
      }
    }
    return allBooks;
  }
}
