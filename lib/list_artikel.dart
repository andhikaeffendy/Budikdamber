import 'package:budikdamber/artikel.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

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
            Expanded(
              child: ListView.builder(
                itemCount: litems.length,
                itemBuilder: (cntx, index){
                  return new GestureDetector(
                    onTap: (){
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
                                'https://images.unsplash.com/photo-1541436293327-8f104af135eb?ixlib=rb-1.2.1&w=1000&q=80',
                              ),
                            ),SizedBox(
                              height: 8.0,
                            ),Container(
                              padding: const EdgeInsets.only(bottom: 6.0, left: 12.0, right: 12.0),
                              child: Text(
                                'Judul Artikel : BUDIKDAMBER Cara merawat tanaman anda dengan baik dan benar',
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
            )
          ],
        ),
      )
    );
  }
}
