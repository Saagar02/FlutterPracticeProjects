
import 'package:flutter/material.dart';

class mainPage extends StatefulWidget{
  @override
  navigationBar createState() => navigationBar();
}

class navigationBar extends State<mainPage>{

  //navigationBar({ Key? key});
  
  int index = 0;
  Widget build (BuildContext context){
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
          ),
        ),
        child: NavigationBar(
          height: 65,
          backgroundColor: Colors.red.shade300,
          destinations: [
            NavigationDestination(icon: Icon(Icons.person_2_rounded), label: "Details"),
            NavigationDestination(icon: Icon(Icons.book_online_rounded), label: "Education"),
            NavigationDestination(icon: Icon(Icons.details_rounded), label: "Projects"),
            NavigationDestination(icon: Icon(Icons.explore_off_rounded), label: "Expertise"),
          ],
          selectedIndex: 0,
          onDestinationSelected: (index) =>setState(() {
            this.index = index;
          })
        ),
      ),
    );
  }
}

