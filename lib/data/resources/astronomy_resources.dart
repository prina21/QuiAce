import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmassignment/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/screens/subjects_knowledge.dart';
import '../../entities/astronomy_note.dart';
import '../../ui/constants.dart';
import 'package:http/http.dart' as http;

class AstronomyResources extends StatefulWidget {
  final User user;
  const AstronomyResources({Key key, this.user}) : super(key: key);

  @override
  _AstronomyResourcesState createState() => _AstronomyResourcesState();
}

class _AstronomyResourcesState extends State<AstronomyResources> {
  List<AstronomyNote> _notes = List<AstronomyNote>();

  Future<List<AstronomyNote>> fetchNotes() async {
    var url = 'https://isro.vercel.app/api/customer_satellites';
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["customer_satellites"];
    var notes = List<AstronomyNote>();
    if (response.statusCode == 200) {
      for (var noteJson in data) {
        notes.add(AstronomyNote.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    print(_notes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grow your Knowledge with us!"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 35),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SubjectsKnowledge(user: widget.user)));
              }),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Container(
                      width: 400,
                      height: 100,
                      child: Container(
                          color: kPrimaryColor,
                          padding: EdgeInsets.all(20),
                          child: Container(
                              child: Container(
                                  child: Center(
                                      child: Text(
                            "${_notes[index].launcher} was launced in ${_notes[index].country} on ${_notes[index].launchDate}",
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))))),
                    ),
                  ),
                ));
          },
          itemCount: _notes.length,
        ));
  }
}
