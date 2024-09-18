import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Column(
            children: [
              Text(
                'Hello Sir',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                textAlign: TextAlign.start,
              ),
              Text(
                'Which book you want o buy?',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}
