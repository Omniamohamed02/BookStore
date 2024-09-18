import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Favourite Books',
          style: TextStyle(
            fontSize: 28,
            color: Colors.grey[700],
          ),
        )),
      ),
    );
  }
}
