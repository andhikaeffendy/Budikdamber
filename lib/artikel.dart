import 'dart:io';

import 'package:budikdamber/api_model/detail_content_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'global/global_variable.dart';

class Artikel extends StatefulWidget {
  @override
  _ArtikelState createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ImageButton(
                      children: <Widget>[],
                      unpressedImage: Image.asset('assets/Menu.png'),
                      pressedImage: Image.asset('assets/Menu.png'),
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
              FutureBuilder(
                future: getContentResponse(),
                builder: (context, snapshot){
                  Data contentData = snapshot.data.data;
                  if(snapshot.data==null){
                    return Container();
                  }else{
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Text(
                            contentData.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),SizedBox(
                          height: 30.0,
                        ),Image.network(contentData.image),
                        SizedBox(
                          height: 12.0,
                        ),Container(
                          margin: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Text(
                            contentData.title,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black38
                            ),
                          ),
                        ),SizedBox(
                          height: 30.0,
                        ),Container(
                          margin: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Text(
                            contentData.body,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DetailContentResponse> getContentResponse()async{
    var dio = Dio();
    print("get detail konten jalan");
    String url = domain + "/api/v1/detail_content?content_id="+selectedContentId.toString();
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : "+response.toString());
    String dummyResponse = '{ "data": { "id": 1, "title": "TUTORIAL BUDIKDAMBER PART 1 || CARA BUDIDAYA IKAN DALAM EMBER YANG MUDAH DAN MENGUNTUNGKAN", "body": "<p>Assalamualaikum Dalam kesempatan kali ini saya akan menjelaskan sistem budidaya baru dalam budidaya perikanan Saksikan video BUDIKDAMBER yang lain nya ya dari part awal sampai sekarang dari pada bingung dan mau mulainya gimana Buruan saksikan video BUDIKDAMBER nya ya Tonton sampai habis ya saudara agar menambah ilmu saudara sekalian Kontak bisnis : Wahyu.pujakela@gmail.com Jangan lupa subscribe ya agar tidak ketinggalan video saya yang terbaru dan tombol loncengnya, like jika suka dengan videonya, komentar jika ada pertanyaan dan masukan untuk video saya yang selanjutnya, share apabila dapat berguna dan bermanfaat bagi orang banyak Salam amis saudara perikanan dimana pun anda berada</p>", "image": "http://budikdamber.wiradipa.com/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--730d84763e4edb490db51a881c9b8b3a31430e7a/bahanbahan.jpg", "youtube_id": "zK0vKnKR0zw", "created_at": "2020-06-20T14:43:38.000+07:00", "updated_at": "2020-06-20T14:43:38.000+07:00" }, "status": "success", "message": "Data Retrieved successfully" }';
    DetailContentResponse newResponse = detailContentResponseFromJson(response.toString());
    //DetailContentResponse newResponse = detailContentResponseFromJson(dummyResponse);
    print("get detail konten beres");

    return newResponse;
  }
}
