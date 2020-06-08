import 'package:budikdamber/emberku.dart';
import 'package:budikdamber/tambah_ember.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'detail_ember.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  List<Map> categories = [
    {'name': 'ember 1', 'iconPath': 'assets/Ember1.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 3', 'iconPath': 'assets/Ember3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateZ(isDrawerOpen ? -0.15 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0), color: Colors.white),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    isDrawerOpen
                        ? IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
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
                          isDrawerOpen = true;
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
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Jumlah Ember Dikelola',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0XFFf1f3f6)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '5',
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Perlu diperiksa',
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0XFFf1f3f6)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '30',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Kondisi Baik',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Emberku',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      ImageButton(
                        children: <Widget>[],
                        unpressedImage: Image.asset('assets/Scan.png'),
                        pressedImage: Image.asset('assets/Scan.png'),
                        height: 25.0,
                        width: 25.0,
                      )
                    ],
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0),
                child: Row(
                  children: <Widget>[
                    ImageButton(
                      children: <Widget>[],
                      unpressedImage: Image.asset('assets/Icon_tambah.png'),
                      pressedImage: Image.asset('assets/Icon_tambah.png'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahEmber()),
                        );
                      },
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailEmber()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 8.0),
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                    color: Color(0XFFf1f3f6),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      categories[index]['iconPath'],
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(categories[index]['name'])
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Resource',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          fontSize: 18.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.tune),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset('assets/Bahan-bahan.png'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Bahan-bahan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset('assets/Bahan-bahan.png'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Persiapan Media',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset('assets/Pembuatan_media.png'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Pembuatan Media',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset('assets/AncamandanPeluang.png'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Ancaman & Peluang',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset('assets/Bahan-bahan.png'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Bahan-bahan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset('assets/Cara_ganti_air.png'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Cara Ganti Air',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset('assets/Masa_panen.png'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Media Panen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFf1f3f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                            'assets/Menu.png',
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 60.0,
                          child: Text(
                            'Lihat Semua',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
