import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  Color clr;
  double width;
  double height;
  Widget child;
  Function onTab;

  MyCard({this.height,this.width,this.onTab,this.child,this.clr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        child: child,
        decoration: BoxDecoration(color: clr,borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
