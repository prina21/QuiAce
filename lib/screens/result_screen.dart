import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/screens/main_menu.dart';
import '../ui/constants.dart';

class ResultScreen extends StatefulWidget {
  final User user;
  final int score;
  final subject;
  ResultScreen(this.score, this.subject, this.user, {Key key})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState(subject);
}

class _ResultScreenState extends State<ResultScreen> {
  final subject;
  _ResultScreenState(this.subject, {Key key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Congratulations",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          Text(
            "You Score is",
            style: TextStyle(color: Colors.white, fontSize: 34.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "${widget.score}/10",
            style: TextStyle(
              color: Colors.green,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainMenu(
                      user: widget.user,
                      subject: subject,
                    ),
                  ));
            },
            shape: StadiumBorder(),
            color: secondaryColor,
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Reapeat the quizz",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
