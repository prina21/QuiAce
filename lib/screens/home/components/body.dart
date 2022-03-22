import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'header_with_seachbox.dart';
import '../../../ui/constants.dart';

class Body extends StatefulWidget {
  final User user;

  const Body({Key key, this.user}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(user: widget.user),
          Center(
            child: Card(
                elevation: 5,
                color: kPrimaryColor.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                  width: 350,
                  height: 350,
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          // padding: EdgeInsets.all(16.0),
                          child: Text(
                              "Hello! If you are looking for expanding or testing your knowledge on ISRO, then you have come to a right pace! \n\nHere, you can learn or improve your knowledge about ISRO a well as test your knowledge on the same by takig a quiz.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)))),
                )),
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
