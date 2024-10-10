import 'package:flutter/material.dart';
import 'package:bookstore/views/widget/catogrey_title.dart';
import 'package:bookstore/views/widget/search_bar.dart';
import 'package:bookstore/model/book.dart';
import '../../service/book_service.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2D9BB),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Sir',
              style: TextStyle(fontSize: 20, color: Color(0xFF17212C)),
            ),
            Text(
              'Which book you want to buy?',
              style: TextStyle(fontSize: 20, color: Color(0xFF17212C)),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
    'Notifications On')));
    }, icon: Icon(Icons.notifications,))
    ]),

      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 12.0),
        child: Column(
          children: [
            const  CustomSearchBar(),
            Expanded(
              child: FutureBuilder<Map<String, List<Book>>>(
                future: BookService().fetchBooksFromCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color:Color(0xFFF2D9BB) ,));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No books found'));
                  } else {
                    final booksByCategory = snapshot.data!;
                    return ListView(
                      children: booksByCategory.entries.map((entry) {
                        String category = entry.key;
                        List<Book> books = entry.value.take(20).toList();


                        return CatogreyTitle(
                          category: category,
                          books: books,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),

    ));
  }
}
