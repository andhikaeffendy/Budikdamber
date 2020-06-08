import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:imagebutton/imagebutton.dart';

class Register extends StatefulWidget {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  Register({
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

  bool _isHidePass = true;

  void _tooglePassword(){
    setState(() {
      _isHidePass = !_isHidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    SizedBox(
                      height: 28.0,
                    ),
                    Image.asset('assets/Logo.png'),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'eBudikdamber',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                    ),
                    Spacer(),
                    Text('Email',
                        style:
                        TextStyle(fontSize: 16.0, color: Colors.deepPurple)),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      autofocus: false,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0XFFf1f3f6),
                        contentPadding: const EdgeInsets.only(
                            left: 8.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white12),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text('Password',
                        style:
                        TextStyle(fontSize: 16.0, color: Colors.deepPurple)),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      autofocus: false,
                      obscureText: _isHidePass,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0XFFf1f3f6),
                        suffixIcon: GestureDetector(
                          onTap: (){_tooglePassword();},
                          child: Icon(
                            _isHidePass ? Icons.visibility_off : Icons.visibility,
                            color: _isHidePass ? Colors.grey : Colors.deepPurple,
                          ),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.only(
                            left: 8.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white12),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white12),
                        ),
                      ),
                    ),SizedBox(
                      height: 16.0,
                    ),
                    Text('Ulangi Password',
                        style:
                        TextStyle(fontSize: 16.0, color: Colors.deepPurple)),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      autofocus: false,
                      obscureText: _isHidePass,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0XFFf1f3f6),
                          contentPadding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white12),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white12),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              _tooglePassword();
                            },
                            child: Icon(
                              _isHidePass ? Icons.visibility_off : Icons.visibility,
                              color: _isHidePass ? Colors.grey : Colors.deepPurple,
                            ),
                          ),
                          isDense: true
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: ImageButton(
                        children: <Widget>[],
                        onTap: () {},
                        pressedImage: Image.asset('assets/Daftar.png'),
                        unpressedImage: Image.asset('assets/Daftar.png'),
                        height: 55.0,
                        width: MediaQuery.of(context).size.width * 0.60,
                      ),
                    ),SizedBox(
                      height: 24.0,
                    ),
                    Center(
                        child: GestureDetector(
                          onTap: (){},
                          child: Text(
                            'Lupa Password ?',
                            style: TextStyle(
                                fontSize: 18.0
                            ),
                          ),
                        )
                    ),Spacer()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
