import 'package:bookstore/model/book.dart';
import 'package:bookstore/providers/cart_provider.dart';
import 'package:bookstore/views/widget/cart_item.dart';
import 'package:bookstore/views/widget/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';

class CartPage extends StatefulWidget {

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);
    final cart = Provider.of<CartProvider>(context);

    final localizations = S.of(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Color(0xFF303E44) : Color(0xFFF2D9BB),
        title:  Text('${localizations.cart}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.count,
              itemBuilder: (context, index) {
                return CartItem(
                  book: cart.books[index],
                  remove: () {
                    cart.remove(cart.books[index]);
                  },
                );
              },
            ),
          ),
          // "Add to Cart" button at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                      return AlertDialog(
                          title:  Text('${localizations.buyNow}',style: TextStyle(color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C) ),),
                          content:  SingleChildScrollView(
                            child: ListBody(
                              children:[
                                Text('${localizations.totalprice}${cart.totalPrice}\$'),
                                Text('${localizations.wytb}'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child:  Text('${localizations.ow}',style: TextStyle(color:themeProvider.isDarkMode? Colors.white : Color(0xFF17212C)),),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                    content: Text(
                                        '${localizations.orderSnak}')));
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                       });
                      },
                    child: Text(
                      '${localizations.buyNow}',
                      style: TextStyle(
                        fontSize: 20,
                        color: themeProvider.isDarkMode
                            ? Color(0xFF17212C)
                            : Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      minimumSize: const Size(100, 40),
                      backgroundColor: const Color(0xFFCCB08F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

