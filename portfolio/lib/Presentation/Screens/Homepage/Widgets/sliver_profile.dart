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
      expandedHeight: 180,
      toolbarHeight: 180,
      
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          //color: Colors.red,
          child: const Center(child: Text('Profile')),
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