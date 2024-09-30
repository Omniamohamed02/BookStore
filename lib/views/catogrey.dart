import 'package:bookstore/views/book-card.dart';
import 'package:flutter/material.dart';

class Catogrey extends StatelessWidget {
  const Catogrey({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: (){},
                child: Text('See more', style: TextStyle(color:Color(0xFF17212C)),
              ),
    ),
         ] ),
        SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return BookCard();
              },
            )
          )
        ]
    );
  }
}
