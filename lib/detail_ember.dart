import 'dart:io';

import 'package:budikdamber/api_model/detail_ember_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:intl/intl.dart';

import 'global/global_variable.dart';

class DetailEmber extends StatefulWidget {
  final String bucketId;

  const DetailEmber({Key key, this.bucketId}) : super(key: key);

  @override
  _DetailEmberState createState() => _DetailEmberState(bucketId);
}

class _DetailEmberState extends State<DetailEmber> {
  String bucketId;
  _DetailEmberState(this.bucketId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 100,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/Logo.png'),
                    Text(
                      'eBudikdamber',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Image.asset('assets/Menu.png'),
                  ],
                ),
              ),
              FutureBuilder(
                future: getDetailEmber(bucketId),
                builder: (context, snapshot){
                  if(snapshot.data == null){
                    return Container();
                  }else{
                    Data ember= snapshot.data.data;
                    return Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/Ember3.png')))),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          ember.name,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.width*0.25,
                          child: FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            label: Text('Edit'),
                            color: Color(0XFFffac30),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Keterangan 1',
                              hintStyle: TextStyle(color: Colors.deepPurple)
                          ),
                        ),SizedBox(
                          height: 12.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Keterangan 2',
                              hintStyle: TextStyle(color: Colors.deepPurple)
                          ),
                        ),SizedBox(
                          height: 12.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Keterangan 3',
                              hintStyle: TextStyle(color: Colors.deepPurple)
                          ),
                        ),SizedBox(
                          height: 12.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Keterangan 4',
                              hintStyle: TextStyle(color: Colors.deepPurple)
                          ),
                        ),SizedBox(
                          height: 28.0,
                        ),ImageButton(
                          children: <Widget>[],
                          unpressedImage: Image.asset('assets/Button_simpan.png'),
                          pressedImage: Image.asset('assets/Button_simpan.png'),
                          height: 45.0,
                          width: 150.0,
                        )
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<DetailEmberResponse> getDetailEmber(String bucket_id)async{
    var dio = Dio();
    print("get detail ember jalan");
    String url = domain + "/api/v1/detail_bucket?bucket_id="+bucket_id;
    //dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : "+response.toString());
    String dummyResponse = '{ "data": { "id": 1, "name": "Ember Kotor", "embed_date": "2020-05-29", "fishes_age": 10, "created_by": 2, "updated_by": null, "created_at": "2020-05-29T14:35:13.000+07:00", "updated_at": "2020-05-29T14:35:44.000+07:00" }, "status": "success", "message": "Data Retrieved successfully" }';
    //ListEmberResponse newResponse = listEmberResponseFromJson(response.toString());
    DetailEmberResponse newResponse = detailEmberResponseFromJson(dummyResponse);
    print("get detail ember beres");

    return newResponse;
  }

}
