class PlanetaryNote {
  String name;
  String place;
  String state;

  PlanetaryNote(this.name, this.place, thissState);

  PlanetaryNote.fromJson(Map<String, dynamic> data) {
    name = data["name"];
    place = data["Place"];
    state = data['State'];
  }
}
