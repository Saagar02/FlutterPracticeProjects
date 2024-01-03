// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SliverProfile extends StatelessWidget {
  const SliverProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      expandedHeight: 200,
      toolbarHeight: 200,
      
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
            color: Colors.blue.withOpacity(0.9),
          //color: Colors.red,
          child: //const Center(child: Text('Profile')),
                Stack(
                  children: [
                    Positioned(
                      top: 45,
                      left: 10,
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          boxShadow: [BoxShadow(
                            color:// Color.fromARGB(170, 247, 59, 45),
                                  Colors.white.withOpacity(0.7),
                            spreadRadius: 3.5,
                            offset: Offset(0,0),
                            blurStyle: BlurStyle.outer
                          )],
                        ),
                        child: //ClipOval(child: Image(image: AssetImage('assets/Images/Profesional.jpg'),fit: BoxFit.fitHeight,)) ,
                              //ClipOval(child: Image(image: AssetImage('assets/Images/Profile.png'),fit: BoxFit.fill,))) ,
                              ClipOval(child: Image(image: AssetImage('assets/Images/Profile2.jpg'),fit: BoxFit.fill,))
                      ) ,
                    ),
                  ],
                )
        ),
      ),
    );
  }
}
/*class ProfileBuilder extends StatelessWidget{
  
  const ProfileBuilder({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context){

    return SliverToBoxAdapter(
      child: Container(
        height: 300,
        color: Colors.blue,
        child: Center(child: Text('Fixed Container')),
      ),
    );
  }
}*/