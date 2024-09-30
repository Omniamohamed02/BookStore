import 'package:bookstore/views/catogrey.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/views/navagationbar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF2D9BB),
          title: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF2D9BB),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Sir',
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  textAlign: TextAlign.start,
                ),
                Text(
                  'Which book you want to buy?',
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Color(0xFF17212C),
              ),
            ),
          ],
        ),
        body:ListView(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2D9BB),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 0.8,color: Color(0xFF17212C)),
                      ),
                      hintText: 'Search for a Book',
                      prefixIcon: Icon(Icons.search,size: 30,color: Color(0xFF17212C),),
                      suffixIcon: IconButton(onPressed: (){},
                          icon: Icon(Icons.clear,color: Color(0xFF17212C),))

                  ),
                ),
              ),
              Catogrey(),
              Catogrey(),
              Catogrey(),
            ],
          ),
      bottomNavigationBar: BottomNavBar(
      selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,

    ));
  }
}
