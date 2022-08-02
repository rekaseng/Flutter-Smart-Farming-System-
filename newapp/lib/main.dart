import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newapp/google_sign_in.dart';
import 'package:newapp/state3.dart';
import 'login-page.dart';
import 'register-page.dart';
import './body.dart';
import 'package:provider/provider.dart';
import 'database/authentication.dart';
import 'welcome.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //try {
    await Firebase.initializeApp();
  //} on FirebaseException catch (e) {
   // print(e.toString());
  //}
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
            value:Authentication(),
        ),
        ChangeNotifierProvider(
          create:(context) => GoogleSignInProvider(),
        )
      ],
    child: MaterialApp(
      title: 'Flutter LoginPage',
    theme: ThemeData(),
      home: Body(),
      routes:{
        RegisterPage.routeName: (ctx)=> RegisterPage(),
        LoginPage.routeName: (ctx) => LoginPage(),
        Body.routeName: (ctx)=> Body(),
        Welcome.routeName: (ctx)=> Welcome(),
        Display.routeName: (ctx)=> Display(),
      }
    )
    );
  }
}

