import 'package:budikdamber/ceklis_peralatan.dart';
import 'package:budikdamber/tambah_ember.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class Emberku extends StatefulWidget {

  @override
  _EmberkuState createState() => _EmberkuState();
}

class _EmberkuState extends State<Emberku> {

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
    return Scaffold(
      body: Container(
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
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Emberku',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),Expanded(
              child: ListView.builder(
                  itemCount: listItem.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CeklisPeralatan()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0XFFf1f3f6),
                        ),child: Row(
                        children: <Widget>[
                          Image.asset('assets/Ember1.png'),
                          SizedBox(
                            width: 12.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Ember 1',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),SizedBox(
                                height: 8.0,
                              ),Container(
                                padding: const EdgeInsets.only(left: 8.0,right: 8.0, top: 2.0, bottom: 2.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(4.0)
                                ),
                                child: Text("Kondisi Baik",style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),SizedBox(
                                height: 8.0,
                              ),Container(
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
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TambahEmber()),
          );
        },
        child: new ImageButton(
          children: <Widget>[],
          pressedImage: Image.asset('assets/Icon_tambah.png'),
          unpressedImage: Image.asset('assets/Icon_tambah.png'),
          width: 55.0,
          height: 55.0,
         )
      )
    );
  }
}
