import 'package:flutter/material.dart';
import 'package:newapp/body.dart';
import 'package:newapp/contact_us.dart';
import 'package:newapp/state3.dart';
import 'background-image.dart';
import './forgotpassword-page.dart';
import 'package:provider/provider.dart';
import '../database/authentication.dart';
//import 'state1.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage>{

    final GlobalKey<FormState> _formKey = GlobalKey();

    Map<String, String> _authData = {
      'email' : '',
      'password ': ''
    };

    void _showErrorDialog(String msg)
    {
      showDialog(
        context:context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occured ! '),
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
    }

    Future<void> _logIn() async {
      if(_formKey.currentState != null) {
        _formKey.currentState!.validate();
        return;
      }
      _formKey.currentState?.save();

      try{
        await Provider.of<Authentication>(context, listen : false).logIn(
            _authData['email']!,
            _authData['password']!
        );
        Navigator.of(context).pushReplacementNamed(Display.routeName);
      }catch (error)
      {
        var errorMessage = 'Authentication Failed. Please try again later.';
        _showErrorDialog(errorMessage);
      }


    }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundLogin(),
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
                            onPressed:() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Body(),maintainState: false),
                              );
                              },
                            child: Image.asset('assets/images/return.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              //Email insert
                              width: 320,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextFormField(
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
                                keyboardType: TextInputType.emailAddress, //only input email address
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                                onChanged: (value)
                                {
                                  _authData['email'] = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              //Password insert
                              child: Column(
                                children: [
                                  Container(
                                    width: 320,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                        border: InputBorder.none,
                                        hintText: '  Password',
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
                                      validator: (value)
                                      {
                                        if(value!.isEmpty || value.length<=5)
                                        {
                                          return 'invalid password';
                                        }
                                        return null;
                                      },
                                      onChanged:(value)
                                      {
                                        _authData['password'] = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextButton(
                              onPressed:() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(), maintainState: false),
                              );
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
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
                                  TextButton(
                                    onPressed: () {
                                      _logIn();
                                      },
                                    child: Image.asset(
                                        'assets/images/loginbutton.png'),
                                      ),
                                              SizedBox(
                                               height: 5,
                                                 ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Contact_us(),maintainState: false),
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
                                    )
                                        ),
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

    ],);

  }
}
