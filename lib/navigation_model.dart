import 'package:flutter/material.dart';

class NavigationModel {
  String title;

  NavigationModel({this.title});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Beranda'),
  NavigationModel(title: 'Profile'),
  NavigationModel(title: 'Emberku'),
  NavigationModel(title: 'Tutorial'),
  NavigationModel(title: 'Statistik'),
  NavigationModel(title: 'Settings'),
  NavigationModel(title: 'FAQ'),
];
