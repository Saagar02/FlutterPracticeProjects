// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ToDosContent extends StatefulWidget {
  ToDosContent({super.key});
  @override
  _ToDoContentState createState() => _ToDoContentState();
}

class _ToDoContentState extends State<ToDosContent> {
  String formattedDate = DateFormat('dd/MM/yy').format(DateTime.now());
  int index = 1;
  Color selectedColor = Colors.yellow.shade200;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 130,
        width: 340,
        decoration: BoxDecoration(
          color: selectedColor,//const Color.fromARGB(255, 212, 237, 239),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:5,left: 5),
              child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child:Icon(Icons.broken_image_rounded,color: Colors.grey,),//Image.asset('todolist/lib/Assets/new PassPort.jpg',height: 10,width: 10,),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height:42,
                              width: 245,
                              color: Colors.transparent,
                              child: Text("Hello",style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 14,height: 1.2),),
                            ),
                            Container(
                              height:50,
                              color: Colors.transparent,
                              child: Text("Hi",style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 12,height: 1.2),),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      height: 30,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 65,
                            color: Colors.transparent,
                            child: Text(formattedDate,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color.fromRGBO(132, 132, 132, 1.0)),textAlign: TextAlign.center,),
                          ),
                          Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                IconButton(onPressed: ()=>(), icon: const Icon(Icons.edit_outlined),iconSize: 25,color: const Color(0xFF02A7B1),alignment: Alignment.topCenter,),
                                IconButton(onPressed: ()=>(), icon: const Icon(Icons.delete_outline),iconSize: 25,color: const Color(0xFF02A7B1),),
                              ],                              
                            )
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
