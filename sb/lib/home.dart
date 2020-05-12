import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  Widget build(BuildContext context){
    return Scaffold(
      body: MaterialButton(
        onPressed: _signOut,
        child: Text('Log out'),
      ),
    );
  }
  void _signOut() async {
    final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
    try{
      await _firebaseauth.signOut();
      Navigator.of(context).pushNamed('/check');
    }
    catch(e) {
      print(e);
    }
  }
}