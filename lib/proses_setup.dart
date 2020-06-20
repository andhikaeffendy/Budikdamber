import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:budikdamber/global/global_variable.dart';

import 'api_model/list_setup_process_response.dart';

class ProsesSetup extends StatefulWidget {
  @override
  _ProsesSetupState createState() => _ProsesSetupState();
}

class _ProsesSetupState extends State<ProsesSetup> {

  var tmpArray = [];

  Map<String, bool> values = {};

  initSetupProcess(){
    List<Datum> listSetup = globalListSetupResponse.data;
    Map<String, bool> valueAlat = {};
    listSetup.forEach((alat) {
      values[alat.name] = false;
    });

    return valueAlat;
  }

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
  void initState() {
    // TODO: implement initState
    initSetupProcess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                          image: AssetImage('assets/List.png')))),
              SizedBox(
                height: 24.0,
              ),ListView(
                  shrinkWrap: true,
                children: values.keys.map((e) => Container(
                  margin: EdgeInsets.only(bottom: 12.0),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.green,
                    value: values[e],
                    title: Text(
                      e,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        values[e] = value;
                      });
                    },
                  ),
                ))
                    .toList(),
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
