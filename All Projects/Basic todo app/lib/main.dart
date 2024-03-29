import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(  seedColor: const Color.fromARGB(53, 168, 93, 249)),
        useMaterial3: true,
      ),
      home:
      //const BottomSheet1(), 
      const HomePage()
    );
  }
}