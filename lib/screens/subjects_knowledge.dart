import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmassignment/data/resources/atmospheric_resources.dart';
import 'package:pmassignment/data/resources/planetary_resources.dart';
import 'package:pmassignment/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/screens/home/home_screen.dart';
import '../data/resources/astronomy_resources.dart';

class SubjectsKnowledge extends StatefulWidget {
  final User user;
  const SubjectsKnowledge({Key key, this.user}) : super(key: key);

  @override
  _SubjectsKnowledgeState createState() => _SubjectsKnowledgeState();
}

class _SubjectsKnowledgeState extends State<SubjectsKnowledge> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 40),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(user: widget.user)));
              }),
          centerTitle: true,
          title: Text('Choose a subject!',
              style: TextStyle(fontSize: 30, color: Colors.black)),
          elevation: 0,
        ),
        body: _getListView(context, widget.user),
      ),
    );
  }
}

ListView _getListView(BuildContext context, User user) {
  return ListView.builder(
    itemCount: 1,
    itemBuilder: (_, index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 15),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AstronomyResources(user: user)));
                },
                child: Container(
                  width: 450,
                  height: 155,
                  child: Container(
                      child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://www.chicagobooth.edu/-/media/project/chicago-booth/enterprise-events/corporate-social-responsibility-revisited/2020/chicago-booth-corporate-social-responsibility-revisited-header.jpg?cx=0.42&cy=0.43&cw=1880&ch=783&hash=4DBB29E0EEA9045BB61C6A7A4D58452D',
                        ),
                      ),
                      Container(
                          child: Container(
                              child: Center(
                                  child: Text(
                        "Astronomy Resources",
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ))))
                    ],
                  )),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 15),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => PlanetaryResources(user: user)));
                },
                child: Container(
                  width: 450,
                  height: 155,
                  child: Container(
                      child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://www.chicagobooth.edu/-/media/project/chicago-booth/enterprise-events/corporate-social-responsibility-revisited/2020/chicago-booth-corporate-social-responsibility-revisited-header.jpg?cx=0.42&cy=0.43&cw=1880&ch=783&hash=4DBB29E0EEA9045BB61C6A7A4D58452D',
                        ),
                      ),
                      Container(
                          child: Container(
                              child: Center(
                                  child: Text(
                        "Planetary Sciences Resources",
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ))))
                    ],
                  )),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 15),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AtmosphericResources(user: user)));
                },
                child: Container(
                  width: 450,
                  height: 155,
                  child: Container(
                      child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://www.chicagobooth.edu/-/media/project/chicago-booth/enterprise-events/corporate-social-responsibility-revisited/2020/chicago-booth-corporate-social-responsibility-revisited-header.jpg?cx=0.42&cy=0.43&cw=1880&ch=783&hash=4DBB29E0EEA9045BB61C6A7A4D58452D',
                        ),
                      ),
                      Container(
                          child: Container(
                              child: Center(
                                  child: Text(
                        "Atmospheric Sciences Resources",
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ))))
                    ],
                  )),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
