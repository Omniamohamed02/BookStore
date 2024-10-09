import 'package:bookstore/cubit/book_state.dart';
import 'package:bookstore/service/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCubit extends Cubit<BookState> {
  final BookService bookService = BookService();

  BookCubit() : super(BookInitial()) {
    getBooks();
  }

  void getBooks({String category = "science"}) async {
    emit(BookLoading());
    try {

      final result = await bookService.fetchBooks(category);
      if (result != null && result.isNotEmpty) {
        emit(BookLoaded(books: result));
      } else {
        emit(BookErorr(massage: 'Not Found'));
      }
    } catch (e) {
      emit(BookErorr(massage: e.toString()));
    }
  }
}
