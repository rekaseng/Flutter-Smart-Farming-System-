import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'background-image.dart';
import 'body.dart';

class Contact_us extends StatelessWidget {
  //const Contact_us({Key? key}) : super(key: key);

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController msg = new TextEditingController();
  //var success = 'Successfully added your contact info';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundHelp(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          child: TextButton(
                            // return to the previous page
                            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Body()),);},
                            child: Image.asset('assets/images/return.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              //Name insert
                              width: 320,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: '  Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat-Medium',
                                      fontSize: 20,
                                      color: Colors.grey[600]),
                                ),
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Medium',
                                    fontSize: 20,
                                    color: Colors.black),
                                keyboardType: TextInputType
                                    .name, 
                                textInputAction: TextInputAction
                                    .next, //move on to the next tab-> password
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Column(
                                      children :[
                                        Container(
                                          //Email insert
                                          width: 320,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                            child: TextFormField(
                                            controller: email,
                                            decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                            border: InputBorder.none,
                                            hintText: '  Email',
                                            hintStyle: TextStyle(
                                            fontFamily: 'Montserrat-Medium',
                                            fontSize: 20,
                                            color: Colors.grey[600]),
                                          ),
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat-Medium',
                                                  fontSize: 20,
                                                  color: Colors.black),
                                              keyboardType: TextInputType
                                                  .emailAddress, //only input email address
                                              textInputAction: TextInputAction
                                                  .next,
                                        )

                                        )]
                                  )
                                ],
                              )

                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: Column(
                                  children: [
                                    Column(
                                        children :[
                                          Container(
                                            //Message insert
                                              width: 320,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(
                                                controller: msg,
                                                decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.symmetric(
                                                      vertical: 10, horizontal: 10),
                                                  border: InputBorder.none,
                                                  hintText: '  Message',
                                                  hintStyle: TextStyle(
                                                      fontFamily: 'Montserrat-Medium',
                                                      fontSize: 20,
                                                      color: Colors.grey[600]),
                                                ),
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat-Medium',
                                                    fontSize: 20,
                                                    color: Colors.black),
                                                keyboardType: TextInputType
                                                    .text, //only input email address
                                                textInputAction: TextInputAction
                                                    .next,
                                              )

                                          )]
                                    )
                                  ],
                                )

                            ),
                            SizedBox(
                              height: 5,
                            ),

                        Column(
                          children: [
                            Container(
                                height: 200,
                                width: 250,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Map <String, dynamic> data = {"name":name.text, "email":email.text, "message":msg.text};
                                        FirebaseFirestore.instance.collection("contactinfo").add(data);
                                        //_showSuccessMsg(success);
                                      },
                                      child: Image.asset('assets/images/submitbutton.png'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
  ]),
                  )],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*void _showSuccessMsg(String msg) {
  var context;
  showDialog(
      context:context,
      builder: (ctx) => AlertDialog(
          title: Text('Successful Saved! '),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ]
      )
  );
}*/



