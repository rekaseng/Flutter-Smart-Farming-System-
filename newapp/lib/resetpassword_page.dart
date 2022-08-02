/*import 'package:flutter/material.dart';
import 'package:newapp/contact_us.dart';
import 'package:newapp/login-page.dart';
import 'background-image.dart';
import './forgotpassword-page.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundResetPassword(),
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
                          child: FlatButton(
                            // return to the previous page
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword(), maintainState: false),
                              );
                            },
                            child: Image.asset('assets/images/return.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text('Create new password', style: TextStyle(
                                      fontFamily: 'Montserrat-Medium',
                                      fontSize: 23,
                                      color: Colors.white),
                                ),
                            SizedBox(height: 30),
                            Container(
                              //Email insert
                              width: 320,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: '  Create new password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat-Medium',
                                      fontSize: 20,
                                      color: Colors.grey[600]),
                                ),
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Medium',
                                    fontSize: 20,
                                    color: Colors.black),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Column(
                                children: [
                                   Text('Confirm your password', style: TextStyle(
                                      fontFamily: 'Montserrat-Medium',
                                      fontSize: 23,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 20,),
                                  Container(
                                    width: 320,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                        border: InputBorder.none,
                                        hintText: '  Confirm your password',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Montserrat-Medium',
                                            fontSize: 20,
                                            color: Colors.grey[600]),
                                      ),
                                      style: TextStyle(
                                          fontFamily: 'Montserrat-Medium',
                                          fontSize: 20,
                                          color: Colors.black),
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
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
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage(),maintainState: false),
                                        );
                                      },
                                      child: Image.asset(
                                          'assets/images/reset_button.png'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   Contact_us(),maintainState: false),
                                        );
                                      },
                                      child: const Text(
                                        'Need Help?',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat-Medium',
                                          fontSize: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}*/
