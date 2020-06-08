import 'package:budikdamber/tambah_ember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagebutton/imagebutton.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  final bool isDrawerOpen = false;
  final double xOffset = 0;
  final double yOffset = 0;
  final double scaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*1,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Color(0XFFf1f3f6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*0.60,
            height: MediaQuery.of(context).size.height*0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0)),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Susi Susanti',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Cipasung, Tasikmalaya',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Beranda',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                  dense: true,
                ),ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                  dense: true,
                ),ListTile(
                  title: Text(
                    'Emberku',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                  dense: true,
                ),ListTile(
                  title: Text(
                    'Tutorial',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                  dense: true,
                ),ListTile(
                  title: Text(
                    'Statistik',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                ),ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                  dense: true,
                ),ListTile(
                  title: Text(
                    'FAQ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){},
                  dense: true,
                )
              ],
            )
          ),Container(
            padding: EdgeInsets.only(left: 20.0),
            child: ImageButton(
              children: <Widget>[],
              pressedImage: Image.asset('assets/Logout.png'),
              unpressedImage: Image.asset('assets/Logout.png'),
              height: 30.0,
              width: 100.0,
            ),
          ),Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Version 1.0.1',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.deepPurple
              ),
            ),
          ),
        ],
      ),
    );
  }
}
