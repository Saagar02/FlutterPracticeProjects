
import 'package:flutter/material.dart';

class Assingment2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Assignment2State();
  }
  
}
class _Assignment2State extends State <Assingment2>{
  @override
    bool box1Color = false;
    bool box2Color = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(

        appBar:  AppBar(
          title: const Text("Color Box"),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children : [ 
                    Container(
                      height:  300,
                      width:  300,
                      color: box1Color? Colors.red : Colors.black,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(onPressed: () => {
                      
                      setState((){
                        box1Color = !box1Color;
                      }),
                    }, child: Text("Box1"))
                  ]
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children : [ 
                    Container(
                      height:  300,
                      width:  300,
                      color: box2Color? Colors.yellow : Colors.black,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(onPressed: () => {
                      
                      setState((){
                        box2Color = !box2Color;
                      }),
                    }, child: Text("Box2"))
                  ]
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

}