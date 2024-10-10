import 'package:bookstore/model/book.dart';
import 'package:bookstore/model/cart.dart';
import 'package:bookstore/model/favorite.dart';
import 'package:bookstore/views/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Description extends StatefulWidget {
  final Book book;
  final VoidCallback onFavoriteToggle;

  const Description({super.key, required this.book, required this.onFavoriteToggle});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<Cart,Favorite>(
        builder: (context,Cart ,Favourite,child){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color(0xFFF2D9BB),
              actions: [
                IconButton(onPressed: (){
                  Favourite.addFav(widget.book);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Added to favorite !')));
                }, icon: Icon(Icons.favorite))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section

                    SizedBox(height: 20),

                    // Book Image
                    Center(
                      child: Container(
                        width: 200,
                        height: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(widget.book.thumbnail), // Updated to use book.thumbnail
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Information Section
                    Text.rich(
                      TextSpan(
                        text: "Title: ",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.title}", // Updated to use book.title
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    Text.rich(
                      TextSpan(
                        text: "Category: ",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.category}", // Updated to use book.category
                            style: TextStyle(fontSize: 18, color: Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Description
                    Text.rich(
                      TextSpan(
                        text: "Description: ",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.description}", // Updated to use book.pageCount
                            style: TextStyle(color: Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Other Details
                    Text.rich(
                      TextSpan(
                        text: "Author: ",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.authors}", // Updated to use book.authors
                            style: TextStyle(color: Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Published Date: ",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.publishedDate}", // Updated to use book.publishedDate
                            style: TextStyle(color: Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Pages: ",
                        style: TextStyle(fontSize: 18, color: Color(0xFFCCB08F)
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${widget.book.pageCount}", // Updated to use book.pageCount
                            style: TextStyle(color: Color(0xFF17212C)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Cart.add(widget.book);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(book: widget.book,)));

                            },
                            child: Text('Add to Cart', style: TextStyle(fontSize: 20, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              minimumSize: Size(100, 40),
                              backgroundColor: Color(0xFFCCB08F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}