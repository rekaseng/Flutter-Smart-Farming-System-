import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newapp/body.dart';
import 'package:newapp/contact_us.dart';
import 'package:newapp/google_sign_in.dart';
import 'package:newapp/welcome.dart';
import 'package:provider/provider.dart';
import 'background-image.dart';
import '../database/authentication.dart';
import 'welcome.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';


class RegisterPage extends StatefulWidget {
  static const routeName = '/register';

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<RegisterPage>{

  final GlobalKey<FormState> _formKey = GlobalKey();
  final FirebaseAuth auth = FirebaseAuth.instance;


  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
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

  Future <void> _register() async
  {
    if(_formKey.currentState != null) {
      _formKey.currentState!.validate();
      return;
    }
    _formKey.currentState?.save();

    try{
      await Provider.of<Authentication>(context, listen : false).register(
          _authData['email']!,
          _authData['password']!
      );
      Navigator.of(context).pushReplacementNamed(Body.routeName);
    }catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundRegister(),
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
                                keyboardType: TextInputType.emailAddress,
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
                                //only input email address
                                //textInputAction: TextInputAction
                                    //.next, //move on to the next tab-> password
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
                              height: 80,
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          style:ElevatedButton.styleFrom(
                            primary:Colors.white,
                            onPrimary: Colors.black,

                          ),
                          icon: FaIcon(FontAwesomeIcons.google,color:Colors.blue),
                          label:Text('Sign Up with Google'),
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                            provider.googleLogin(context);
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Container(
                                width: 250,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ), TextButton(
                                      onPressed:() {
                                        _register();
                                      },
                                      child: Image.asset(
                                          'assets/images/register_button.png'),
                                    ),
                                    SizedBox(
                                      height: 10,
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

}