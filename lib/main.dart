import 'package:bookstore/firebase_options.dart';
import 'package:bookstore/model/cart.dart';
import 'package:bookstore/model/favorite.dart';
import 'package:bookstore/views/pages/auth.dart';
import 'package:bookstore/views/widget/navagationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'cubit/book_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (ctx) => Favorite(),
        ),
       ChangeNotifierProvider(
    create: (ctx) => Cart()),
    ],
     child:  MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Auth()
    ));
  }
}
