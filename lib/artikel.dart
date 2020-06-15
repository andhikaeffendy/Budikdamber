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
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),Container(
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
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Lorem Kaprude Ngapruru layhap nuain Kuprol kuprol',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),SizedBox(
              height: 30.0,
            ),Image.network('https://p4.wallpaperbetter.com/wallpaper/58/849/262/nature-solo-plants-leaves-wallpaper-preview.jpg'),
            SizedBox(
              height: 12.0,
            ),Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                'Teknik Budidaya Ikan dan sayur dalam ember atau BUDIKDAMBER.',
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
                'Lorem Kaprude Ngapruru layhap nuain Kuprol kuprol Pokoknya ini isi dari artikel lalalada dasjdnas ajsdnakjsndasjlkdn asdjn aslkjdnalksdn',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
