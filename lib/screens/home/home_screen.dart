import 'package:pmassignment/main.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/screens/home/components/body.dart';
import '../../ui/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'components/my_bottom_button.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.check_box_outline_blank,
                color: kPrimaryColor,
              ),
              onPressed: () {}),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: MaterialButton(
                  onPressed: () {
                    _signOut().whenComplete(() {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return new MyApp();
                      }));
                    });
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                        child: Center(
                      child: Text("Log Out",
                          style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            letterSpacing: 1,
                          )),
                    )),
                  )),
            )
            //IconButton
          ],
          elevation: 0,
        ),
        body: Body(user: widget.user),
        bottomNavigationBar: MyBottomButton(user: widget.user));
  }

  Future _signOut() async {
    await _auth.signOut();
  }
}
