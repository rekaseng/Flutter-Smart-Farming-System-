import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'body.dart';

class Welcome extends StatelessWidget{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static const routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          ElevatedButton(
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Symbiote', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
           /* SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),*/
          ],
        ),
      ),
    );
  }
}