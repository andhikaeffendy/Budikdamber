import 'dart:io';

import 'package:budikdamber/api_model/bucket_maintenance_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'api_model/basic_response.dart';
import 'global/global_variable.dart';

class Perawatan extends StatefulWidget {
  final String bucketId;

  const Perawatan({Key key, this.bucketId}) : super(key: key);

  @override
  _PerawatanState createState() => _PerawatanState(bucketId);
}

class _PerawatanState extends State<Perawatan> {
  var tmpArray = [];
  String bucketId;
  _PerawatanState(this.bucketId);

  Map<String, bool> values = {
    'Mengganti Air': false,
    'Potong Tangkai Kangkung': false,
    'Memberi Makan Lele': false,
    'Mango': false,
    'Orange': false,
  };

  var valuesDatum = {};

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
        scrollDirection: Axis.vertical,
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
              FutureBuilder(
                future: getPerawatan(),
                builder: (context,snapshot){
                  valuesDatum.clear();
                  if(snapshot.data == null){
                    return Container();
                  }else{
                    List<Datum> maintenanceData = snapshot.data.data;
                    maintenanceData.forEach((element) {
                      bool tempStatus = false;
                      if(element.mainStatus == 1){
                        tempStatus = true;
                      }
                      return valuesDatum[element] = tempStatus;
                    });
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: valuesDatum.keys.map((e) {
                        Datum data = e;
                            return Container(
                                child: SwitchListTile(
                                  value: valuesDatum[e],
                                  onChanged: (bool value) {
                                    int status = 0;
                                    if(value == true){
                                      status = 1;
                                    }
                                    updateBucketMaintenance(status, data.id).then((task){
                                      setState(() {
                                        valuesDatum[e]= value;
                                      });
                                    });

                                  },
                                  activeColor: Colors.green,
                                  title: Text(
                                    formatDate.format(data.mainDate),
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.deepPurple),
                                  ),
                                  subtitle: Text(
                                    data.name,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ));
                      })
                          .toList(),
                    );
                  }
                },
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

  Future<BucketMaintenanceResponse> getPerawatan() async {
    var dio = Dio();
    print("get list bucket maintenance jalan");
    String url = domain + "/api/v1/bucket_maintenances?bucket_id="+bucketId;
    dio.options.headers[HttpHeaders.authorizationHeader] =
        'Bearer ' + globalUserDetails.idToken;
    Response response = await dio.get(url);
    print("response : " + response.toString());
    String dummyResponse =
        '{ "data": [ { "id": 44, "name": "Cuci Ember", "main_date": "2020-07-06", "main_status": 0, "created_at": "2020-06-22T14:29:36.000+07:00", "updated_at": "2020-06-22T14:29:36.000+07:00" }, { "id": 45, "name": "Cuci Ember", "main_date": "2020-07-13", "main_status": 0, "created_at": "2020-06-22T14:29:36.000+07:00", "updated_at": "2020-06-22T14:29:36.000+07:00" } ], "status": "success", "message": "Data Retrieved successfully" }';
    BucketMaintenanceResponse newResponse = bucketMaintenanceResponseFromJson(response.toString());
    //BucketMaintenanceResponse newResponse = bucketMaintenanceResponseFromJson(dummyResponse);
    print("get list bucket maintenance beres");


    return newResponse;
  }

  updateBucketMaintenance(int status, int id) async {
    var dio = Dio();
    print("update jalan, id = " + id.toString());
    String url = domain + "/api/v1/update_bucket_maintenance";
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + globalUserDetails.idToken;
    FormData formData = new FormData.fromMap({
      "bucket_maintenance_id": id,
      "status": status.toString(),
    });
    Response response = await dio.post(url, data: formData);
    print("Update Maintenance = "+response.toString());
  }
}
