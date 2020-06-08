import 'package:budikdamber/emberku.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:imagebutton/imagebutton.dart';

class TambahEmber extends StatefulWidget {
  @override
  _TambahEmberState createState() => _TambahEmberState();
}

class _TambahEmberState extends State<TambahEmber> {
  listDropDown selectedField;
  List<listDropDown> fieldList = <listDropDown>[
    const listDropDown('Satu'),
    const listDropDown('Dua'),
    const listDropDown('Tiga'),
  ];

  String _date = "Not set";
  String _time = "Not set";

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String _valFriends;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*100,
                height: MediaQuery.of(context).size.height*0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/Logo.png'),
                    Text(
                      'eBudikdamber',
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),SizedBox(
                      width: 12.0,
                    ),
                    Image.asset('assets/Menu.png'),

                  ],
                ),
              ),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/Ember3.png')))),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Nama Ember',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFf1f3f6),
                  contentPadding:
                      const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Field',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              DropdownButton<listDropDown>(
                isExpanded: true,
                value: selectedField,
                focusColor: Colors.black12,
                onChanged: (listDropDown newValue) {
                  setState(() {
                    selectedField = newValue;
                  });
                },
                items: fieldList.map((listDropDown user) {
                  return new DropdownMenuItem<listDropDown>(
                    value: user,
                    child: new Text(
                      user.name,
                      style: new TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 12.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              RaisedButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.deepPurple,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Field',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold
                ),
              ),SizedBox(
                height: 12.0,
              ),
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFf1f3f6),
                  contentPadding:
                  const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                  ),
                ),
              ),SizedBox(
                height: 35.0,
              ),
              Center(
                child: ImageButton(
                  children: <Widget>[],
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Emberku()),
                    );
                  },
                  pressedImage: Image.asset('assets/Button_tambah.png'),
                  unpressedImage: Image.asset('assets/Button_tambah.png'),
                  height: 45.0,
                  width: 150.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class listDropDown {
  const listDropDown(this.name);

  final String name;
}
