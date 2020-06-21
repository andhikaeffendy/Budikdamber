import 'dart:io';

import 'package:budikdamber/api_model/list_content_response.dart';
import 'package:budikdamber/api_model/list_ember_response.dart';
import 'package:budikdamber/api_model/list_setup_process_response.dart';
import 'package:budikdamber/artikel.dart';
import 'package:budikdamber/collapse_list_item.dart';
import 'package:budikdamber/emberku.dart';
import 'package:budikdamber/list_artikel.dart';
import 'package:budikdamber/navigation_bloc/navigation_bloc.dart';
import 'package:budikdamber/perawatan.dart';
import 'package:budikdamber/tambah_ember.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagebutton/imagebutton.dart';

import 'api_model/list_peralatan_response.dart';
import 'detail_ember.dart';
import 'global/global_variable.dart';
import 'navigation_model.dart';

class Dashboard extends StatefulWidget with NavigationStates{
  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard>{

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  //bool isDrawerOpen = false;


  List<Map> categories = [
    {'name': 'ember 1', 'iconPath': 'assets/Ember1.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 2', 'iconPath': 'assets/Ember2.png'},
    {'name': 'ember 3', 'iconPath': 'assets/Ember3.png'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    getListPeralatan();
    getListSetupProcess();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(isCollapse ? xOffset = 180 : xOffset, isCollapse ? yOffset=150: yOffset, 0)
        ..scale(isCollapse ? scaleFactor = 0.7: scaleFactor)
        ..rotateZ(isCollapse ? -0.15 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0), color: Colors.white),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
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
                        onTap: (){
//                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.EmberkuClickEvent);
//                         currentSelected = 2;
//                         debugPrint(navigationItems[currentSelected].title);
                        },
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
                      width: MediaQuery.of(context).size.width * 0.17,
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: FutureBuilder(
                        future: getListEmber(),
                        builder: (context, snapshot){
                          if(snapshot.data == null){
                            return Container();
                          }else{
                            ListEmberResponse listEmberResponse = snapshot.data;
                            List<Ember> listEmber = listEmberResponse.data;
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listEmber.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailEmber(bucketId: listEmber[index].id.toString())),
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
                                          Text(listEmber[index].name)
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                        },
                      ),
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
              SizedBox(
                height: 20.0,
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = 1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFf1f3f6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset('assets/Bahan-bahan.png'),
                          ),
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = 2;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFf1f3f6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset('assets/Bahan-bahan.png'),
                          ),
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = 3;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFf1f3f6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset('assets/Pembuatan_media.png'),
                          ),
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = 4;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFf1f3f6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset('assets/AncamandanPeluang.png'),
                          ),
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = 5;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFf1f3f6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset('assets/Bahan-bahan.png'),
                          ),
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = 6;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFf1f3f6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset('assets/Cara_ganti_air.png'),
                          ),
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = 7;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFf1f3f6),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset('assets/Masa_panen.png'),
                          ),
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
                        InkWell(
                          onTap: (){
                            selectedContentCategoryId = null;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListArtikel()),
                            );
                          },
                          child: Container(
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
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<ListEmberResponse> getListEmber()async{
    var dio = Dio();
    print("get list ember jalan");
    String url = domain + "/api/v1/buckets";
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : "+response.toString());
    String dummyResponse = '{"data": [{"id": 1,"name": "Ember Kotor","embed_date": "2020-05-29","fishes_age": 10,"created_by": 2,"updated_by": null,"created_at": "2020-05-29T14:35:13.000+07:00","updated_at": "2020-05-29T14:35:44.000+07:00"},{"id": 2,"name": "Ember Plastik","embed_date": "2020-05-29","fishes_age": 40,"created_by": 1,"updated_by": null,"created_at": "2020-05-29T14:41:43.000+07:00","updated_at": "2020-05-29T14:41:43.000+07:00"}],"status": "success","message": "Data Retrieved successfully"}';
    ListEmberResponse newResponse = listEmberResponseFromJson(response.toString());
    //ListEmberResponse newResponse = listEmberResponseFromJson(dummyResponse);
    print("get list ember beres");

    return newResponse;
  }



  getListPeralatan() async {
    var dio = Dio();
    print("get list peralatam jalan");
    String url = domain + "/api/v1/tools";
    dio.options.headers[HttpHeaders.authorizationHeader] =
        'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : " + response.toString());
    String dummyResponse =
        '{ "data": [ { "id": 1, "name": "Obeng", "description": "Obeng Serba Guna", "image": "http://localhost:3000/images/field/liga1_original_1.jpg?1590737531", "created_by": null, "updated_by": 2, "created_at": "2020-05-29T14:28:39.000+07:00", "updated_at": "2020-05-29T14:32:12.000+07:00" } ], "status": "success", "message": "Data Retrieved successfully" }';
    //ListEmberResponse newResponse = listEmberResponseFromJson(response.toString());
    ListPeralatanResponse newResponse = listPeralatanResponseFromJson(dummyResponse);
    print("get list peralatan beres");

    globalListPeralatanResponse = newResponse;

    return newResponse;
  }

  getListSetupProcess() async {
    var dio = Dio();
    print("get list Setup jalan");
    String url = domain + "/api/v1/tools";
    dio.options.headers[HttpHeaders.authorizationHeader] =
        'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : " + response.toString());
    String dummyResponse =
        '{ "data": [ { "id": 1, "name": "Mulai Dari Awal", "days_after": 25, "created_at": "2020-05-29T14:34:28.000+07:00", "updated_at": "2020-05-29T14:34:28.000+07:00" } ], "status": "success", "message": "Data Retrieved successfully" }';
    //ListSetupProcessResponse newResponse = listSetupProcessResponseFromJson(response.toString());
    ListSetupProcessResponse newResponse = listSetupProcessResponseFromJson(dummyResponse);
    print("get list Setup beres");

    globalListSetupResponse = newResponse;

    return newResponse;
  }


}
