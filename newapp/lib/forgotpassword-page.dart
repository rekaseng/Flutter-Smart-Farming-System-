import 'package:flutter/material.dart';
import 'package:newapp/contact_us.dart';
import 'background-image.dart';
import './login-page.dart';
import '../database/authentication.dart';
import 'package:provider/provider.dart';



class ForgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<ForgotPassword>{

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _authData = {'email' : ''};


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

  Future <void> _forgotPassword() async
  {
    if(_formKey.currentState != null) {
      _formKey.currentState!.validate();
      return;
    }
    _formKey.currentState?.save();

    try{
      await Provider.of<Authentication>(context, listen : false).forgotPassword(
          _authData['email']!,
      );
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }


  }

  /*_forgotPassword() async {


    String email = _emailController.text.toString();
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }catch(error){
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundForgotPassword(),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), maintainState: false),);
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
                            Text('Enter your email address', style: TextStyle(
                                      fontFamily: 'Montserrat-Medium',
                                      fontSize: 28,
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
                                }, //move on to the next tab-> password
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Column(
                          children: [
                            Container(
                                width: 250,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 90,
                                    ),
                                    TextButton(
                                      onPressed:() async {
                                        _forgotPassword();
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
}