import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class Perawatan extends StatefulWidget {
  @override
  _PerawatanState createState() => _PerawatanState();
}

class _PerawatanState extends State<Perawatan> {
  var tmpArray = [];

  Map<String, bool> values = {
    'Mengganti Air': false,
    'Potong Tangkai Kangkung': false,
    'Memberi Makan Lele': false,
    'Mango': false,
    'Orange': false,
  };

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
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
              SizedBox(
                height: 20.0,
              ),
              Image.asset('assets/calendar.png',height: 50.0, width: 50.0, fit: BoxFit.fill),
              SizedBox(
                height: 12.0,
              ),
              ListView(
                shrinkWrap: true,
                children: values.keys
                    .map((e) => Container(
                        child: SwitchListTile(
                          value: values[e],
                          onChanged: (bool value) {
                            setState(() {
                              values[e] = value;
                            });
                          },
                          activeColor: Colors.green,
                          title: Text(
                            '11 April 2020',
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.deepPurple),
                          ),
                          subtitle: Text(
                            e,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        )))
                    .toList(),
              ),
              SizedBox(
                height: 28.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
