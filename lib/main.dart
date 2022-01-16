import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  final String title='Elegibility Checker';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      routes: {
        '/home-screen':(_)=> HomeScreen(title: title,),
      },
      home:  HomeScreen(title: title,),
    );
  }
}