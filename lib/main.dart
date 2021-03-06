import 'package:budikdamber/Dashboard.dart';
import 'package:budikdamber/ceklis_peralatan.dart';
import 'package:budikdamber/detail_ember.dart';
import 'package:budikdamber/drawer_screen.dart';
import 'package:budikdamber/login_form.dart';
import 'package:budikdamber/navigation_bloc/navigation_bloc.dart';
import 'package:budikdamber/peta_buyer.dart';
import 'package:budikdamber/proses_setup.dart';
import 'package:budikdamber/register.dart';
import 'package:budikdamber/start_aplikasi.dart';
import 'package:budikdamber/tambah_ember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartAplikasi(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listitem = ['atu', 'dua', 'tiga', 'empat', 'lima'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            DrawerScreen(),
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationStates){
                return navigationStates as Widget;
              },
            )
          ],
        ),
      )
    );
  }
}
