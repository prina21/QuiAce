import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/screens/quiz_screen.dart';
import 'package:pmassignment/screens/subjects_quiz.dart';
import '../ui/constants.dart';

class MainMenu extends StatefulWidget {
  final User user;
  final subject;
  const MainMenu({Key key, this.user, this.subject}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState(subject: subject);
}

class _MainMenuState extends State<MainMenu> {
  final subject;

  _MainMenuState({Key key, this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 40),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubjectsQuiz(user: widget.user)));
            }),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48.0,
          horizontal: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "QuiAce",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: RawMaterialButton(
                  onPressed: () {
                    //Navigating the the Quizz Screen

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuizzScreen(user: widget.user, subject: subject),
                        ));
                  },
                  shape: const StadiumBorder(),
                  fillColor: secondaryColor,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      "Start the Quizz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
