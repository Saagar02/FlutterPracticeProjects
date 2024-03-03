import 'package:flutter/material.dart';
import './Assignment2.dart';
import './Assignment3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home :Assignment3()
            //Assingment2() 
            //MyHomePage(title: "Table of 2")
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _count = 0;
  void _printTableViwe(){
    setState(() {
      _count = _count!+2;
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table of 2"),
        backgroundColor: Colors.red,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text (
              "Click button to print Table values",
            ),
            Text(
              "$_count",
            ),
            const SizedBox (
              height: 20,
              ),

              ElevatedButton(onPressed: _printTableViwe
              , child: const Text("Print"),
              
              ),

            
          ],
        ),
      )
    );
  }
}

