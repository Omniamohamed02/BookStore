import 'package:bookstore/model/book.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier{
  List<Book> books =[];
  double _totalPrice=0.0;

  void add(Book book){
    books.add(book);
    notifyListeners();
  }

  void remove(Book book){
    books.remove(book);
    notifyListeners();

  }

  int get count{
    return books.length;
  }

  double get totalPrice{
    return _totalPrice;
  }

}