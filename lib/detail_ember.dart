import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class DetailEmber extends StatefulWidget {
  @override
  _DetailEmberState createState() => _DetailEmberState();
}

class _DetailEmberState extends State<DetailEmber> {
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
                'Nama Ember',
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
          ),
        ),
      ),
    );
  }
}
