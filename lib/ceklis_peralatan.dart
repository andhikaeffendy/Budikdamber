import 'package:budikdamber/proses_setup.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class CeklisPeralatan extends StatefulWidget {
  @override
  _CeklisPeralatanState createState() => _CeklisPeralatanState();
}

class _CeklisPeralatanState extends State<CeklisPeralatan> {
  
  var tmpArray = [];

  Map<String, bool> values = {
    'Apple': false,
    'Banana': false,
    'Cherry': false,
    'Mango': false,
    'Orange': false,
  };

  getCheckboxItems(){

    values.forEach((key, value) {
      if(value == true)
      {
        tmpArray.add(key);
      }
    });
    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

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
                          image: AssetImage('assets/Peralatan.png')))),
              SizedBox(
                height: 12.0,
              ),
              ListView(
                shrinkWrap: true,
                children: values.keys.map((e) => Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: CheckboxListTile(
                            value: values[e],
                            title: Text(
                              e,
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                            secondary: Image.asset(
                              'assets/Ember3.png',
                              height: 50.0,
                              width: 50.0,
                            ),
                            onChanged: (bool value) {
                              setState(() {
                                values[e] = value;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 28.0,
              ),ImageButton(
                children: <Widget>[],
                unpressedImage: Image.asset('assets/Button_simpan.png'),
                pressedImage: Image.asset('assets/Button_simpan.png'),
                height: 45.0,
                width: 150.0,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProsesSetup()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
