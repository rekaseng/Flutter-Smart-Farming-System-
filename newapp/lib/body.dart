import 'package:flutter/material.dart';
import 'package:newapp/login-page.dart';
import 'package:newapp/register-page.dart';
import 'background-image.dart';

class Body extends StatefulWidget {
  static const routeName = '/body';

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<Body>{


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundHome(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 445,
                ),
                Center(
                  child: Container(
                    height: 110,
                    width: 240,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(),
                              maintainState: false),
                        );
                      },
                      child: Image.asset('assets/images/loginbutton.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Container(
                    width: 240,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                              maintainState: false),
                        );
                      },
                      child: Image.asset('assets/images/register_icon.png'),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
