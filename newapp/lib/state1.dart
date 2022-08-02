/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'dart:ui';
import 'dart:io';


class page1 extends StatefulWidget {


  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {

  // Future<Null>_page1State() async{
  // await Future.delayed(Duration(seconds: 2)); //sample
  // }
  @override
  Widget build(BuildContext context) {

    var EC;
    var Humidity;
    var Moisture;
    var TDS;
    var Temperature;
    final dbRef = FirebaseDatabase.instance.reference().child('');


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: TextButton(child:Text('re'), onPressed: () {


          setState(() {});
        },
        ),
      ),
      body: FutureBuilder(


        future: dbRef.once(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data.value);
            EC = snapshot.data.value['EC'];
            Humidity = snapshot.data.value['Humidity'];
            Moisture = snapshot.data.value['Moisture'];
            TDS = snapshot.data.value['TDS'];
            Temperature = snapshot.data.value['Temperature'];
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('EC'), Text(EC.toString())],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Humidity'), Text(Humidity.toString())],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Moisture'), Text(Moisture.toString())],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('TDS'), Text(TDS.toString())],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Temperature'), Text(Temperature.toString())],
              ),
            ],
          );

        },
      ),
    );
  }
}*/
