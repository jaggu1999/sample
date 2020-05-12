import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForPass extends StatefulWidget{
  ForPassState createState() => ForPassState();
}

class ForPassState extends State<ForPass>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  bool flag = true;
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffAFDBDE),
      body: Stack(
        children: <Widget>[
          flag ? ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-220),
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
                  height: 310,
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
                                padding: EdgeInsets.only(top: 20),
                                child: Center(
                                  child: Text(
                                    'Reset Your Password here!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                              SizedBox(height: 15,),
                              Container(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                child: MaterialButton(
                                  onPressed: _passRes,
                                  child: Text('Send Confirmation Mail',
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
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                child: MaterialButton(
                                  onPressed: (){Navigator.pop(context);},
                                  child: Text('GO BACK',
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
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-220),
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
                  height: 325,
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
                            padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                'Reset Your Password here!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                            child: MaterialButton(
                              onPressed: _passRes,
                              child: Text('Send Confirmation Mail',
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
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                            child: MaterialButton(
                              onPressed: (){Navigator.pop(context);},
                              child: Text('GO BACK',
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
    ],
    ),
    );
  }
  Future<String> _passRes() async {
    setState(() {
      flag = false;
    });
    final FormState form = _formKey.currentState;
    final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
    if(_formKey.currentState.validate()){
      form.save();
      try{
        await _firebaseauth.sendPasswordResetEmail(email: _email);
        return null;
      }
      catch(e) {
        return 'There is a problem!';
      }
    }
  }
}