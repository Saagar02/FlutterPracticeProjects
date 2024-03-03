import 'dart:html';

import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});
  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  int? selectIndex = 0;
  final List<String> imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFdukQdGS2w2Kz8PPZ2JnWnpcCvvaYPTplDUxzil072g&s",
    "https://www.smsstriker.com/smsstriker-img/image-shorturl-services.jpg",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fscreenrant.com%2Fcars-4-movie-updates%2F&psig=AOvVaw3dWYXkga8GFAOLDCbodNKD&ust=1705380754262000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCPCIzMPM3oMDFQAAAAAdAAAAABAY"
  ];
  void showNextImage() {
    setState(() {
      selectIndex = selectIndex! + 1;
      print(selectIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Images"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageList[selectIndex!],
              height: 300,
              width: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showNextImage();
              },
              child: const Text("Next"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if(selectIndex == 2){
                  selectIndex = 0;
                }
                setState(() {
                  selectIndex = 0;
                });
              },
              child: const Text("RESET"),
            ),
          ],
        ),
      ),
    );
  }
}
