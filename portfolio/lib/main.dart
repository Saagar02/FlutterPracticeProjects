import 'package:flutter/material.dart';
import 'package:portfolio/Presentation/Screens/Homepage/UI/navigation_Bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My PortFolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: MyBottomNavBar(),
      )
      /*initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,*/
    );
  }
}
