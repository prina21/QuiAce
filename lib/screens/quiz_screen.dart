import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/data/quesions/atmospheric_sciences.dart';
import 'package:pmassignment/data/quesions/planetary_sciences_qestions.dart';
import 'package:pmassignment/data/quesions/astronomy_questions.dart';
import 'package:pmassignment/screens/result_screen.dart';
import '../ui/constants.dart';

class QuizzScreen extends StatefulWidget {
  final User user;
  final subject;
  const QuizzScreen({Key key, this.subject, this.user}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState(subject: subject);
}

class _QuizzScreenState extends State<QuizzScreen> {
  final subject;
  _QuizzScreenState({Key key, this.subject});
  var questionsList;
  int score = 0;
  bool btnPressed = false;
  PageController _controller;
  String btnText = "Next Question";
  bool answered = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    if (subject == "Astronomy") {
      questionsList = astronomyQuestions;
    } else if (subject == "Planetary Sciences") {
      questionsList = planetaryQuestions;
    } else {
      questionsList = atmosphericQuestions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (page) {
              if (page == questionsList.length - 1) {
                setState(() {
                  btnText = "See Results";
                });
              }
              setState(() {
                answered = false;
              });
            },
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/10",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Text(
                      "${questionsList[index].question}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  for (int i = 0; i < questionsList[index].answers.length; i++)
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      margin: EdgeInsets.only(
                          bottom: 20.0, left: 12.0, right: 12.0),
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: btnPressed
                            ? questionsList[index].answers.values.toList()[i]
                                ? Colors.green
                                : Colors.red
                            : Colors.white,
                        onPressed: !answered
                            ? () {
                                if (questionsList[index]
                                    .answers
                                    .values
                                    .toList()[i]) {
                                  score++;
                                  print("yes");
                                } else {
                                  print("no");
                                }
                                setState(() {
                                  btnPressed = true;
                                  answered = true;
                                });
                              }
                            : null,
                        child:
                            Text(questionsList[index].answers.keys.toList()[i],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                )),
                      ),
                    ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      if (_controller.page?.toInt() ==
                          questionsList.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultScreen(score, subject, widget.user)));
                      } else {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInExpo);

                        setState(() {
                          btnPressed = false;
                        });
                      }
                    },
                    shape: StadiumBorder(),
                    fillColor: Colors.blue,
                    padding: EdgeInsets.all(18.0),
                    elevation: 0.0,
                    child: Text(
                      btnText,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            },
            itemCount: questionsList.length,
          )),
    );
  }
}
