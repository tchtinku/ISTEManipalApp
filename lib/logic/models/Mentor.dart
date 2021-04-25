class Mentor {
  String name;
  String company;
  int year;
  String briefDescription;

  Mentor(this.name, this.company, this.year, this.briefDescription);
  Mentor.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    company = json['company'];
    year = json['year'];
    briefDescription = json['brief_description'];
  }
}
