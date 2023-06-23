import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../utils/utils.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({super.key});

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  final _auth = FirebaseAuth.instance;
  bool _loading = false;
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/loginsignup.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/loginsignup.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Container(
                      width: 250,
                      height: 200,
                      /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo-color.png'),
                        radius: 50,
                      )),
                ),
              ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 41, 39, 39),
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.fromLTRB(16, 45, 16, 20),
                child: reusableText("Enter you email", Icons.email, false,
                    _emailTextController),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 108, 189, 255),
                          Colors.pinkAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      try {
                        _auth.sendPasswordResetEmail(
                            email: _emailTextController.text);
                        // .then((value) => Navigator.of(context).pop());
                        if (_emailTextController.text != null &&
                            _emailTextController.text.contains("@gmail.com")) {
                          Navigator.of(context).pop();
                        }
                      } catch (e) {
                        showErrorDialog(context, e.toString());
                      }
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
