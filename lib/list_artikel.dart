import 'dart:io';

import 'package:budikdamber/artikel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'api_model/list_content_response.dart';
import 'global/global_variable.dart';


class ListArtikel extends StatefulWidget {
  @override
  _ListArtikelState createState() => _ListArtikelState();
}

class _ListArtikelState extends State<ListArtikel> {

  List<String> litems = ["1","2","Third","4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Container(
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
            FutureBuilder(
              future: getContentListResponse(),
              builder: (context, snapshot){
                if(snapshot.data == null){
                  return Container();
                }else{
                  List<Datum> listContent = snapshot.data.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: listContent.length,
                      itemBuilder: (cntx, index){
                        return new GestureDetector(
                          onTap: (){
                            selectedArticleId = listContent[index].id;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Artikel()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Material(
                              elevation: 10.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 12.0, right: 12.0),
                                    child: Image.network(
                                      listContent[index].image,
                                    ),
                                  ),SizedBox(
                                    height: 8.0,
                                  ),Container(
                                    padding: const EdgeInsets.only(bottom: 6.0, left: 12.0, right: 12.0),
                                    child: Text(
                                      listContent[index].title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                      ),
                                    ),
                                  ), SizedBox(
                                    height: 12.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      )
    );
  }

  Future<ListContentResponse> getContentListResponse()async{
    var dio = Dio();
    print("get list artikel jalan category = " + selectedContentCategoryId.toString());
    String url = domain + "/api/v1/contents?content_category_id=" + selectedContentCategoryId.toString();
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : "+response.toString());
    String dummyResponse = '{ "data": [ { "id": 1, "title": "TUTORIAL BUDIKDAMBER PART 1 || CARA BUDIDAYA IKAN DALAM EMBER YANG MUDAH DAN MENGUNTUNGKAN", "body": "<p>Assalamualaikum Dalam kesempatan kali ini saya akan menjelaskan sistem budidaya baru dalam budidaya perikanan Saksikan video BUDIKDAMBER yang lain nya ya dari part awal sampai sekarang dari pada bingung dan mau mulainya gimana Buruan saksikan video BUDIKDAMBER nya ya Tonton sampai habis ya saudara agar menambah ilmu saudara sekalian Kontak bisnis : Wahyu.pujakela@gmail.com Jangan lupa subscribe ya agar tidak ketinggalan video saya yang terbaru dan tombol loncengnya, like jika suka dengan videonya, komentar jika ada pertanyaan dan masukan untuk video saya yang selanjutnya, share apabila dapat berguna dan bermanfaat bagi orang banyak Salam amis saudara perikanan dimana pun anda berada</p>", "image": "http://budikdamber.wiradipa.com/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--730d84763e4edb490db51a881c9b8b3a31430e7a/bahanbahan.jpg", "youtube_id": "zK0vKnKR0zw", "created_at": "2020-06-20T14:43:38.000+07:00", "updated_at": "2020-06-20T14:43:38.000+07:00" } ], "status": "success", "message": "Data Retrieved successfully" }';
    ListContentResponse newResponse = listContentResponseFromJson(response.toString());
    //ListContentResponse newResponse = listContentResponseFromJson(dummyResponse);
    print("get list artikel beres");

    return newResponse;
  }
}
