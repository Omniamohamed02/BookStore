import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),
      child: Stack(
        children: [

           Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color:const Color(0xFFF2D9BB),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.network(
                  'https://www.headline.co.uk/wp-content/uploads/2019/01/hbg-title-9780747237662-43.jpg?resize=448,720',
                  height: 100,
                ),
              ),

              const Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Father',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17212C),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Anne Baker',
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

              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
