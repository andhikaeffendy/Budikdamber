import 'package:budikdamber/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:imagebutton/imagebutton.dart';

class StartAplikasi extends StatefulWidget {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  StartAplikasi({
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  @override
  _StartAplikasiState createState() => _StartAplikasiState();
}

class _StartAplikasiState extends State<StartAplikasi> {
  Widget Cobacoba() {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '06.20 PM',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24.0
                ),
              ),SizedBox(
                width: 16.0,
              ),Image.asset('assets/cuaca.png'),SizedBox(
                width: 12.0,
              ),
              Text(
                '34 C',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18.0
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nov.10.2020',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0
                ),
              ),SizedBox(
                width: 8.0,
              ),Text(
                '|',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0
                ),
              ),SizedBox(
                width: 8.0,
              ),Text(
                'Rabu',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 1,
              child: Image.network(
                'https://i.pinimg.com/originals/5d/66/09/5d6609150b338d0f5829814c1f2fa4f9.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Cobacoba(),
                  Spacer(),
                  Image.asset('assets/Logo.png'),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'eBudikdamber',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 16.0),
                      children: <TextSpan>[
                        TextSpan(text: 'Aplikasi tutorial dan pengelolaan ', style: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Bud', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                        TextSpan(text: 'idaya ',style: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Ik',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold)),
                        TextSpan(text: 'an ',style: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold)),
                        TextSpan(text: 'da',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold)),
                        TextSpan(text: 'lam e',style: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold)),
                        TextSpan(text: 'mber',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold)),
                      ]
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Gratis',
                    style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    ),
                  ),
                  Spacer(),
                  Center(
                    //BUTTON INI BUAT LOGIN GOOGLE YAH NIL, ICONNYA MAKE INI AJA SAMPE DAPAT ICON YANG LAIN
                    child: ImageButton(
                      children: <Widget>[],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),);
                      },
                      pressedImage: Image.asset('assets/Icon_masuk.png'),
                      unpressedImage: Image.asset('assets/Icon_masuk.png'),
                      height: 55.0,
                      width: MediaQuery.of(context).size.width * 0.60,
                    ),
                  ),SizedBox(
                    height: 24.0,
                  ),
                  Spacer()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
