import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newapp/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'body.dart';


class Display extends StatefulWidget {
  //Display({Key? key}) : super(key: key);
  static const routeName = '/display';
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  List<String> name = ['EC', 'HUMIDITY', 'TDS', 'TEMPERATURE', 'MOISTURE'];

List<num>value=[];

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
          title: Text('Live Feed Data'),
          centerTitle: true,
          actions: [
            TextButton(
              child: Text('LogOut'),
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(
                    context, listen: false);
                provider.logOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Body(),maintainState: false),
                );
              },
            ),
          ],
          backgroundColor: Color(0xff121421),
          leading: IconButton( onPressed: () {
            setState(() {

            });
          }, icon: Icon(Icons.refresh),
          ),
        ),

        body: FutureBuilder(

            future: dbRef.once(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData){
                print(snapshot.data.value);
              EC = snapshot.data.value['EC'];
              Humidity = snapshot.data.value['Humidity'];
              Moisture = snapshot.data.value['Moisture'];
              TDS = snapshot.data.value['TDS'];
              Temperature = snapshot.data.value['Temperature'];
              value=[];
              print(EC.runtimeType);
              value.add(EC);
              value.add(Humidity);
              value.add(TDS);
              value.add(Temperature);
              value.add(Moisture);

            return Container(
            color: Color(0xff20b700),
        // decoration: BoxDecoration(image: DecorationImage(
        // image: AssetImage('assets/images/ANALYSIST.png'),
        //   fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.only(top:80),
              child: GridView.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 2),
                  itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  width: 100,
                  child: Stack(
                      children: [
                      Image.asset(
                      'assets/images/background1.png', fit: BoxFit.cover,),
                      Stack(
                            children: <Widget>[
                            Center(child: Column(
                              children: [
                                Text(name[index],style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,height: 5 ), ),
                                Text(value[index].toString(),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold, height: 1 ), )

                              ],
                            ),),



                           ],
                    )
                    ],
                    ));

                    }),
            )

    );}
              else{
           return Center(child: CircularProgressIndicator(),);
    }
    }

    ));
  }
}