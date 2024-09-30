import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 300,
      child: Column(
        children: [
      Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://www.headline.co.uk/wp-content/uploads/2019/01/hbg-title-9780747237662-43.jpg?resize=448,720',
                ),
            ),
          ),Column(
            mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('father', style: TextStyle(
                color: Color(0xFF17212C),
                fontSize: 16,
                fontWeight: FontWeight.bold),),
                 Text('anne Baker',
            style: TextStyle(color: Color(0xFF454D56), fontSize: 12,),)
              ],
            )



          ],
      ),
    );
  }
}
