import 'dart:io';

import 'package:budikdamber/ceklis_peralatan.dart';
import 'package:budikdamber/navigation_bloc/navigation_bloc.dart';
import 'package:budikdamber/tambah_ember.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'api_model/list_ember_response.dart';
import 'global/global_variable.dart';

class Emberku extends StatefulWidget with NavigationStates {
  @override
  _EmberkuState createState() => _EmberkuState();
}

class _EmberkuState extends State<Emberku> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  //bool isDrawerOpen = false;

  List<String> listItem = [
    "1",
    "2",
    "Third",
    "4",
    "4",
    "4",
    "4",
    "4",
    "4",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          transform: Matrix4.translationValues(
              isCollapse ? xOffset = 180 : xOffset, isCollapse ? yOffset = 150 : yOffset, 0)
            ..scale(isCollapse ? scaleFactor = 0.7 : scaleFactor)
            ..rotateZ(isCollapse ? -0.15 : 0),
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0), color: Colors.white),
          child: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 100,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                              onTap: () {
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
                  height: 20.0,
                ),
                Text(
                  'Emberku',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getListEmber(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Container();
                      } else {
                        ListEmberResponse listEmberResponse = snapshot.data;
                        List<Ember> listEmber = listEmberResponse.data;
                        return ListView.builder(
                            itemCount: listEmber.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CeklisPeralatan()),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12.0),
                                  margin: EdgeInsets.only(bottom: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Color(0XFFf1f3f6),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset('assets/Ember1.png'),
                                      SizedBox(
                                        width: 12.0,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              listEmber[index].name,
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 2.0,
                                                bottom: 2.0),
                                            decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(4.0)),
                                            child: Text(
                                              "Kondisi Baik (Statik)",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              listEmber[index]
                                                  .fishesAge
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Container(
                                            child: Text(
                                              'Minggu',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
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
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.0, bottom: 20.0),
              child: ImageButton(
                children: <Widget>[],
                pressedImage: Image.asset('assets/Icon_tambah.png'),
                unpressedImage: Image.asset('assets/Icon_tambah.png'),
                width: 55.0,
                height: 55.0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TambahEmber()),
                  );
                },
              ),
            ))
      ],
    );
  }

  Future<ListEmberResponse> getListEmber() async {
    var dio = Dio();
    print("get list ember jalan");
    String url = domain + "/api/v1/buckets";
    dio.options.headers[HttpHeaders.authorizationHeader] =
        'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : " + response.toString());
    String dummyResponse =
        '{"data": [{"id": 1,"name": "Ember Kotor","embed_date": "2020-05-29","fishes_age": 10,"created_by": 2,"updated_by": null,"created_at": "2020-05-29T14:35:13.000+07:00","updated_at": "2020-05-29T14:35:44.000+07:00"},{"id": 2,"name": "Ember Plastik","embed_date": "2020-05-29","fishes_age": 40,"created_by": 1,"updated_by": null,"created_at": "2020-05-29T14:41:43.000+07:00","updated_at": "2020-05-29T14:41:43.000+07:00"}],"status": "success","message": "Data Retrieved successfully"}';
    //ListEmberResponse newResponse = listEmberResponseFromJson(response.toString());
    ListEmberResponse newResponse = listEmberResponseFromJson(dummyResponse);
    print("get list ember beres");

    return newResponse;
  }
}
