class AstronomyNote {
  String country;
  String launchDate;
  String launcher;

  AstronomyNote(this.country, this.launchDate, this.launcher);

  AstronomyNote.fromJson(Map<String, dynamic> data) {
    country = data["country"];
    launchDate = data["launch_date"];
    launcher = data['launcher'];
  }
}
