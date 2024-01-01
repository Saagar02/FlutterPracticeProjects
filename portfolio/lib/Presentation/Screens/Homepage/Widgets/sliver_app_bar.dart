import 'package:flutter/material.dart';

class SliverAppBarBuilder extends StatelessWidget {
  const SliverAppBarBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: false,
      centerTitle: false,
      stretch: true,
      expandedHeight: 180.0,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text("Sagar Chaudhari",
                style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 212, 255, 0)
              ),
        ),
        centerTitle: true,
        stretchModes: [StretchMode.zoomBackground],
        collapseMode: CollapseMode.parallax,
        background: Image(
          image: AssetImage('assets/Images/BackGroup.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
