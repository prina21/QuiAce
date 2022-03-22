import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmassignment/entities/atmospheric_note.dart';
import 'package:pmassignment/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:pmassignment/screens/subjects_knowledge.dart';
import '../../ui/constants.dart';
import 'package:http/http.dart' as http;

class AtmosphericResources extends StatefulWidget {
  final User user;
  const AtmosphericResources({Key key, this.user}) : super(key: key);

  @override
  _AtmosphericResourcesState createState() => _AtmosphericResourcesState();
}

class _AtmosphericResourcesState extends State<AtmosphericResources> {
  List<AtmosphericNote> _notes = List<AtmosphericNote>();

  Future<List<AtmosphericNote>> fetchNotes() async {
    var url = 'https://isro.vercel.app/api/spacecrafts';
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["spacecrafts"];
    var notes = List<AtmosphericNote>();
    if (response.statusCode == 200) {
      for (var noteJson in data) {
        notes.add(AtmosphericNote.fromJson(noteJson));
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
          title: Text("List of names of Spacecrafts!"),
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
                            "${_notes[index].id} ) ${_notes[index].name}",
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
