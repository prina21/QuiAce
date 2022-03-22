import 'package:pmassignment/ui/constants.dart';
import 'package:pmassignment/authentication/signup.dart';
import 'package:pmassignment/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'authentication/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new SafeArea(
            child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Image.asset(
                  'assets/images/pmlogo.png',
                  scale: 1.2,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Let's Learn together",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "expand your knowledge with us",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Image.asset('assets/images/pmhome.png'),
                SizedBox(height: 50),
                new MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return new Login();
                      }));
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                offset: Offset(0, 10),
                                spreadRadius: -10)
                          ]),
                      child: Container(
                          child: Center(
                        child: Text("Sign In",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 1,
                            )),
                      )),
                    )),
                SizedBox(height: 15),
                RaisedButton(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new SignUp();
                    }));
                  },
                ),
              ]),
            ),
          ),
        )));
  }
}
