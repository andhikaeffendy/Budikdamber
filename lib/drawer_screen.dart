import 'package:budikdamber/Dashboard.dart';
import 'package:budikdamber/profile.dart';
import 'package:budikdamber/collapse_list_item.dart';
import 'package:budikdamber/emberku.dart';
import 'package:budikdamber/navigation_bloc/navigation_bloc.dart';
import 'package:budikdamber/navigation_model.dart';
import 'package:budikdamber/tambah_ember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:flutter/foundation.dart';

import 'global/global_variable.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Color(0XFFf1f3f6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(40.0)),
                      color: Colors.white),
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
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            width: 250,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: navigationItems.length,
                itemBuilder: (context, index) {
                  return CollapseListItem(
                    onTap: (){
                        setState(() {
                          currentSelected = index;
                          if (index == 1) {
                            isCollapse = true;
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ProfileClickEvent);
                          }else if (index == 2) {
                            isCollapse = true;
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.EmberkuClickEvent);
                          }  else if (index == 3) {
                            isCollapse = true;
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.TutorialClickEvent);
                          }  else if (index == 4) {
                            isCollapse = true;
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.StatistikClickEvent);
                          }  else if (index == 5) {
                            isCollapse = true;
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SettingsClickEvent);
                          }  else if (index == 6) {
                            isCollapse = true;
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.FAQClickEvent);
                          }  else if(index == 0){
                            isCollapse = true;
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.BerandaClickEvent);
                          }
                        });
                    },
                    isSelected: currentSelected == index,
                    title: navigationItems[index].title,
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: ImageButton(
              children: <Widget>[],
              pressedImage: Image.asset('assets/Logout.png'),
              unpressedImage: Image.asset('assets/Logout.png'),
              height: 30.0,
              width: 100.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Version 1.0.1',
              style: TextStyle(fontSize: 12.0, color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
