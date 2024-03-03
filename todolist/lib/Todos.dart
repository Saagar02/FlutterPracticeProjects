
import 'package:flutter/material.dart';

class ToDoContent extends StatefulWidget {
  const ToDoContent({super.key});

  @override
  _ToDoContentState createState() => _ToDoContentState();
}

class _ToDoContentState extends State<ToDoContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 212, 237, 239),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10),
              child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child:Image.asset("A:/Flutter_/FlutterClassProjects/todolist/lib/Assets/PassPort.jpg",height: 10,width: 10,),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: 125,
                        width : 210,
                        color: Colors.transparent,
                        child: ListView(
                          children :const [
                            Column(
                              children: [
                                Text("Lorem Ipsum is simply setting industry.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                SizedBox(height: 5,),
                                Text("Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",),
                              ],
                            )
                          ]
                        ),
                      ),
                    ],
                  ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                      height: 30,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(onPressed: () => (), icon: const Icon(Icons.edit),iconSize: 25,alignment: Alignment.topLeft,color: Colors.white/*const Color(0xFF02A7B1)*/,),
                              IconButton(onPressed: () => (), icon: const Icon(Icons.delete),iconSize: 25,alignment: Alignment.topLeft,color: Colors.white/*const Color(0xFF02A7B1)*/,)
                            ],
                          ),
                        ],
                      ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
