class User {
  String username;
  String firstName;
  String lastName;
  String email;
  double points;
  User(this.username, this.email, this.firstName, this.lastName, this.points);

  User.fromJson(Map<dynamic, dynamic> json)
      : email = json['email'],
        username = json["username"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        points = 0;
}
