import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmassignment/screens/subjects_quiz.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/screens/subjects_knowledge.dart';

import '../../../ui/constants.dart';

class MyBottomButton extends StatelessWidget {
  final User user;
  MyBottomButton({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        SizedBox(
          width: size.width / 2,
          height: 60,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
              ),
            ),
            color: kPrimaryColor,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new SubjectsKnowledge(user: user);
              }));
            },
            child: Text(
              "Lern about ISRO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new SubjectsQuiz(user: user);
              }));
            },
            child: Text(
              "Take a ISRO Quiz",
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
