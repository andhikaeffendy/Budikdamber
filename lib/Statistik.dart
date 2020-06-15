import 'package:budikdamber/navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'global/global_variable.dart';

class Statistik extends StatefulWidget with NavigationStates{
  @override
  _StatistikState createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(isCollapse?180:xOffset, isCollapse?150:yOffset, 0)
        ..scale(isCollapse?0.7:scaleFactor)
        ..rotateZ(isCollapse ? -0.15 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0), color: Colors.white),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                isCollapse
                    ? IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isCollapse = false;
                    });
                  },
                )
                    : ImageButton(
                  children: <Widget>[],
                  unpressedImage: Image.asset('assets/Menu.png'),
                  pressedImage: Image.asset('assets/Menu.png'),
                  onTap: (){
                    setState(() {
                      xOffset = 180;
                      yOffset = 150;
                      scaleFactor = 0.7;
                      isCollapse = true;
                    });
                  },
                  width: 25.0,
                  height: 25.0,
                ),
                Text(
                  'eBudikdamber',
                  style: TextStyle(
                      fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/Logo.png'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
