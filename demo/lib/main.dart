import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hellsdfdo"),
      ),
      body:Container(
          //height: double.infinity,
          //width: double.infinity,
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color:Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow:[ 
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0,0),
                    spreadRadius: 0,
                    blurStyle: BlurStyle.solid
                  )
                ]
              ),
            ),
          ),
      ),
    );
  }
}

