import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'home.dart';

class CheckStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: _streamAuthState,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none) {
          //TODO Splash Screen is to be completed
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          user = snapshot.data;
          if (user == null || snapshot.hasError) {
            return Check();
          }
          else return Home();
          //return Check();
        }
      },
    );
  }
}

class Check extends StatefulWidget{
  CheckState createState() => CheckState();
}

FirebaseUser user;
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
Stream<FirebaseUser> _streamAuthState = _firebaseAuth.onAuthStateChanged;

class CheckState extends State<Check>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool pressed = true;
  bool flag = true;
//  Animation animation;
//  AnimationController animationController;
//  void initState(){
//    super.initState();
//    animationController = AnimationController(duration: Duration(seconds: 2),vsync: this);
//    animation = Tween(begin: -1, end: 0).animate(CurvedAnimation(
//      parent: animationController, curve: Curves.fastOutSlowIn
//    ));
//    animationController.forward();
//    animationController.reverse();
//  }
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffAFDBDE),
      body: Stack(
            children: <Widget>[
              flag ? pressed ? ListView(
                children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-270),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/Images/hai.png',height: 50,width: 50,fit: BoxFit.cover,),
                    SizedBox(width: 5,),
                    Text(
                      'GetPlaced',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        //color: Color(0xff065a9f),
                        color: Colors.black45,
                        //color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: 275,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Container(
                      child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                  child: TextFormField(
                                    validator: (input) {
                                      if(input.isEmpty){
                                        return 'Please enter an Email';
                                      }
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black38, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'USER NAME',
                                      prefixIcon: Icon(Icons.person_pin),
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black38
                                      ),
                                      filled: true,
                                      fillColor: Colors.lightBlue[50],
                                    ),
                                    onSaved: (input) => _email = input,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                                  child: TextFormField(
                                    validator: (input) {
                                      if(input.length<6){
                                        return 'Password should be atleast 6 characters';
                                      }
                                    },
                                    obscureText: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black38, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'PASSWORD',
                                      prefixIcon: Icon(Icons.lock),
                                      labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black38
                                      ),
                                      filled: true,
                                      fillColor: Colors.lightBlue[50],
                                    ),
                                    onSaved: (input) => _password = input,
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    final FormState form = _formKey.currentState;
                                    form.reset();
                                    Navigator.of(context).pushNamed('/forpass');
                                  },
                                  child: Center(
                                    child: Text(
                                      'Forgot Your Password?',
                                      style: TextStyle(
                                          color: Color(0xff065a9f),
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic
                                        //decoration: TextDecoration.underline,
                                        //decorationColor: Colors.green,
                                        //decorationThickness: 2
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                      child: MaterialButton(
                                        onPressed: _signIn,
                                        child: Text('LOG IN',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        color: Color(0xff4FBDCC),
                                        elevation: 0,
                                        minWidth: 400,
                                        height: 50,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                                      child: MaterialButton(
                                        onPressed: _signUp,
                                        child: Text('REGISTER',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        color: Colors.white,
                                        elevation: 0,
                                        minWidth: 400,
                                        height: 50,
                                        textColor: Color(0xff4FBDCC),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(30, 90, 30, 20),
                                      child: OutlineButton(
                                        onPressed: (){},
                                        child: Row(
                                          children: <Widget>[
                                            Image(image: AssetImage("assets/Images/google_logo.png"), height: 25.0),
                                            SizedBox(width: 5,),
                                            Text(
                                              'Sign in with Google',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                    ],
    ),
    ),
                    ),
    ),
    ),
                                ],
              ) : ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-270),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/Images/hai.png',height: 50,width: 50,fit: BoxFit.cover,),
                        SizedBox(width: 5,),
                        Text(
                          'GetPlaced',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            //color: Color(0xff065a9f),
                            color: Colors.black45,
                            //color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 275,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                child: TextFormField(
                                  validator: (input) {
                                    if(input.isEmpty){
                                      return 'Please enter an Email';
                                    }
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black38, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    labelText: 'USER NAME',
                                    prefixIcon: Icon(Icons.person_pin),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black38
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightBlue[50],
                                  ),
                                  onSaved: (input) => _email = input,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                                child: TextFormField(
                                  validator: (input) {
                                    if(input.length<6){
                                      return 'Password should be atleast 6 characters';
                                    }
                                  },
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black38, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    labelText: 'PASSWORD',
                                    prefixIcon: Icon(Icons.lock),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black38
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightBlue[50],
                                  ),
                                  onSaved: (input) => _password = input,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  final FormState form = _formKey.currentState;
                                  form.reset();
                                  Navigator.of(context).pushNamed('/forpass');
                                },
                                child: Center(
                                  child: Text(
                                    'Forgot Your Password?',
                                    style: TextStyle(
                                        color: Color(0xff065a9f),
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic
                                      //decoration: TextDecoration.underline,
                                      //decorationColor: Colors.green,
                                      //decorationThickness: 2
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                    child: MaterialButton(
                                      onPressed: _signUp,
                                      child: Text('REGISTER',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Color(0xff4FBDCC),
                                      elevation: 0,
                                      minWidth: 400,
                                      height: 50,
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                                    child: MaterialButton(
                                      onPressed: _signIn,
                                      child: Text('LOG IN',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Colors.white,
                                      elevation: 0,
                                      minWidth: 400,
                                      height: 50,
                                      textColor: Color(0xff4FBDCC),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 90, 30, 20),
                                    child: OutlineButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: <Widget>[
                                          Image(image: AssetImage("assets/Images/google_logo.png"), height: 25.0),
                                          SizedBox(width: 5,),
                                          Text(
                                            'Sign in with Google',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ): pressed ? ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-270),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/Images/hai.png',height: 50,width: 50,fit: BoxFit.cover,),
                        SizedBox(width: 5,),
                        Text(
                          'GetPlaced',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            //color: Color(0xff065a9f),
                            color: Colors.black45,
                            //color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 275,
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                child: TextFormField(
                                  validator: (input) {
                                    if(input.isEmpty){
                                      return 'Please enter an Email';
                                    }
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black38, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    labelText: 'USER NAME',
                                    prefixIcon: Icon(Icons.person_pin),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black38
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightBlue[50],
                                  ),
                                  onSaved: (input) => _email = input,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                                child: TextFormField(
                                  validator: (input) {
                                    if(input.length<6){
                                      return 'Password should be atleast 6 characters';
                                    }
                                  },
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black38, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    labelText: 'PASSWORD',
                                    prefixIcon: Icon(Icons.lock),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black38
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightBlue[50],
                                  ),
                                  onSaved: (input) => _password = input,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  final FormState form = _formKey.currentState;
                                  form.reset();
                                  Navigator.of(context).pushNamed('/forpass');
                                },
                                child: Center(
                                  child: Text(
                                    'Forgot Your Password?',
                                    style: TextStyle(
                                        color: Color(0xff065a9f),
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic
                                      //decoration: TextDecoration.underline,
                                      //decorationColor: Colors.green,
                                      //decorationThickness: 2
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                    child: MaterialButton(
                                      onPressed: _signIn,
                                      child: Text('LOG IN',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Color(0xff4FBDCC),
                                      elevation: 0,
                                      minWidth: 400,
                                      height: 50,
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                                    child: MaterialButton(
                                      onPressed: _signUp,
                                      child: Text('REGISTER',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Colors.white,
                                      elevation: 0,
                                      minWidth: 400,
                                      height: 50,
                                      textColor: Color(0xff4FBDCC),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 90, 30, 20),
                                    child: OutlineButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: <Widget>[
                                          Image(image: AssetImage("assets/Images/google_logo.png"), height: 25.0),
                                          SizedBox(width: 5,),
                                          Text(
                                            'Sign in with Google',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ) : ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-270),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/Images/hai.png',height: 50,width: 50,fit: BoxFit.cover,),
                        SizedBox(width: 5,),
                        Text(
                          'GetPlaced',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            //color: Color(0xff065a9f),
                            color: Colors.black45,
                            //color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 275,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                child: TextFormField(
                                  validator: (input) {
                                    if(input.isEmpty){
                                      return 'Please enter an Email';
                                    }
                                  },
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black38, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    labelText: 'USER NAME',
                                    prefixIcon: Icon(Icons.person_pin),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black38
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightBlue[50],
                                  ),
                                  onSaved: (input) => _email = input,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                                child: TextFormField(
                                  validator: (input) {
                                    if(input.length<6){
                                      return 'Password should be atleast 6 characters';
                                    }
                                  },
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black38, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    labelText: 'PASSWORD',
                                    prefixIcon: Icon(Icons.lock),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black38
                                    ),
                                    filled: true,
                                    fillColor: Colors.lightBlue[50],
                                  ),
                                  onSaved: (input) => _password = input,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  final FormState form = _formKey.currentState;
                                  form.reset();
                                  Navigator.of(context).pushNamed('/forpass');
                                },
                                child: Center(
                                  child: Text(
                                    'Forgot Your Password?',
                                    style: TextStyle(
                                        color: Color(0xff065a9f),
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic
                                      //decoration: TextDecoration.underline,
                                      //decorationColor: Colors.green,
                                      //decorationThickness: 2
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                    child: MaterialButton(
                                      onPressed: _signUp,
                                      child: Text('REGISTER',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Color(0xff4FBDCC),
                                      elevation: 0,
                                      minWidth: 400,
                                      height: 50,
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                                    child: MaterialButton(
                                      onPressed: _signIn,
                                      child: Text('LOG IN',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Colors.white,
                                      elevation: 0,
                                      minWidth: 400,
                                      height: 50,
                                      textColor: Color(0xff4FBDCC),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 90, 30, 20),
                                    child: OutlineButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: <Widget>[
                                          Image(image: AssetImage("assets/Images/google_logo.png"), height: 25.0),
                                          SizedBox(width: 5,),
                                          Text(
                                            'Sign in with Google',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

                              ],
                            ),
                          );
  }
  Future<String> _signIn() async {
    setState(() {
      pressed = true;
      flag = false;
    });
    final FormState form = _formKey.currentState;
    final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
    if(_formKey.currentState.validate()){
      form.save();
      try{
        FirebaseUser user= (await _firebaseauth.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.of(context).pushReplacementNamed('/home');
        print('Logged in successful');
        return null;
      }
      catch(e){
        String mes;
        switch (e.code) {
          case "ERROR_USER_NOT_FOUND": mes = 'The username or password is incorrect.';
            break;
          case "ERROR_WRONG_PASSWORD": mes =  'The username or password is incorrect.';
            break;
          default: mes = 'The username or password is incorrect.';
        }
        return mes;
      }
    }
  }
  Future<String> _signUp() async {
    setState(() {
      pressed = false;
      final FormState form = _formKey.currentState;
      form.reset();
    });
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      user = result.user;
      user.sendEmailVerification();
      Navigator.of(context).pushReplacementNamed('/details1');
      return null;
    } catch (e) {
      return 'Unexpected error! Please try after sometime.';
    }
  }
}
