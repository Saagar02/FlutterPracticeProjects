import 'package:flutter/material.dart';
import 'package:portfolio/Presentation/Screens/Homepage/UI/home_page.dart';
import 'package:portfolio/Presentation/Screens/Homepage/UI/navigation_Bar.dart';
import 'package:portfolio/Presentation/Screens/Homepage/Widgets/sliver_profile.dart';
import 'Presentation/Routes/generated_routes.dart';

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
      /*home: Scaffold(
        bottomNavigationBar: HomePage(title: 'My Portfolio'),
      )*/
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
