import 'package:bookstore/model/book.dart';
import 'package:flutter/widgets.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Book> FavBooks =[];


  void addFav(Book book){
    FavBooks.add(book);
    notifyListeners();
  }

  void removeFav(Book book){
    FavBooks.remove(book);
    notifyListeners();
  }

}