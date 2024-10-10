import 'package:bookstore/model/book.dart';
import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  final Book book;
   var remove ;

  FavouriteCard({super.key, required this.book,required remove});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF2D9BB),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.network(
                  '${book.thumbnail}',
                  height: 100,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${book.title}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17212C),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${book.authors}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF454D56),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFF17212C)),
                          Icon(Icons.star, color: Color(0xFF17212C)),
                          Icon(Icons.star, color: Color(0xFF17212C)),
                          Icon(Icons.star, color: Color(0xFF17212C)),
                          Icon(Icons.star, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(onPressed: remove, icon: Icon(Icons.favorite))
              ),
            ],
          ),
        ],
      ),
    );
  }
}
