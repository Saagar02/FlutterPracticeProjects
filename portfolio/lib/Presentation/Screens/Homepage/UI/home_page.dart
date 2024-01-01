import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../UI/navigation_Bar.dart';
import '../Widgets/sliver_content.dart';
import '../Widgets/sliver_app_bar.dart';
import '../Widgets/sliver_info.dart';
import '../Widgets/sliver_list.dart';

import '../Widgets/sliver_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
  /*return Scaffold(
    body: Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBarBuilder(),
              SliverProfile(),
            ],
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20),
                sliver: SliverListBldr(),
              ),
            ],
          ),
        ),
      ],
    ),
  );*/

  return const Scaffold(
    body: CustomScrollView(
      slivers:[
        SliverAppBarBuilder(),
        SliverProfile(),
        //SliverPadding(
          //padding: EdgeInsets.symmetric(vertical: 20),
          //sliver: 
        
        SliverPadding(
          padding: EdgeInsets.only(top: 10,left: 20,right: 10),  
          sliver: sliverContent()
        ),
        //),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 0),   
          sliver : SliverListBldr()
                  //sliverInfo()
        ),

        /*SliverToBoxAdapter(
          child: const DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical()
            ),  
            child: SliverListBldr(),
          ),
         
        ),*/
        /*SliverList(
          delegate: DecoratedBox(
            decoration: BoxDecoration(),
            child: SliverChildListDelegate([
                      Column(
                    // Your Column content here
                      )
                    ]),
          )
          ,
        ),*/

      ],
    ),
  );
}
}
