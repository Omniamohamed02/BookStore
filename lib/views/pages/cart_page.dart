import 'package:bookstore/model/book.dart';
import 'package:bookstore/model/cart.dart';
import 'package:bookstore/views/widget/cart_item.dart';
import 'package:bookstore/views/widget/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final Book book;


  const CartPage({super.key, required this.book});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, Cart,child){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFCCB08F),
              title: Text('Cart'),
              centerTitle: true,

            ),
           body: ListView.builder(
               itemCount: Cart.count,
               itemBuilder: (context,index){
                 return CartItem(book: Cart.books[index],remove:(){ Cart.remove(Cart.books[index]);});
               }),
          );
        }
    );
  }
}
