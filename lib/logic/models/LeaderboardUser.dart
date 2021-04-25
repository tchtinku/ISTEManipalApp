class LeaderboardUser {
  String username;
  String firstName;
  String lastName;
  String points;
  LeaderboardUser(this.firstName, this.lastName, this.points, this.username);

  LeaderboardUser.fromJson(Map<dynamic, dynamic> json) {
    username = json['user']['username'];
    firstName = json['user']['first_name'];
    lastName = json['user']['last_name'];
    points = json['points'];
  }
}
