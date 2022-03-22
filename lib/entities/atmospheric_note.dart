class AtmosphericNote {
  var id;
  String name;

  AtmosphericNote(this.id, this.name);

  AtmosphericNote.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
  }
}
