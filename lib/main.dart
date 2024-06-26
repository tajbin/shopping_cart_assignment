import 'package:flutter/material.dart';
import 'package:shopping_cart/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xF9F9F9),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: const Color(0xF9F9F9F9),
        ),

      ),
      home: const HomeScreen(),
    );
  }
}
