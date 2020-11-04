class User {
  String name;
  String profession;
  String about;

  User({this.name, this.profession, this.about});
}

class Profile {
  User user;
  int following;
  int followers;
  int friends;

  Profile({this.user, this.following, this.followers, this.friends});
}
