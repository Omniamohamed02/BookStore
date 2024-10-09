import '../model/book.dart';

abstract class BookState{
}

class BookInitial extends BookState{}
class BookLoading extends BookState{}
class BookLoaded extends BookState{
  final List<Book>books;

  BookLoaded({ required this.books,});
}
class BookErorr extends BookState{
  final String massage;

  BookErorr({required this.massage,});

}