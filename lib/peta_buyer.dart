import 'package:flutter/material.dart';


class PetaBuyer extends StatefulWidget {
  @override
  _PetaBuyerState createState() => _PetaBuyerState();
}

class _PetaBuyerState extends State<PetaBuyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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

            ],
          ),
        ),
      ),
    );
  }
}
