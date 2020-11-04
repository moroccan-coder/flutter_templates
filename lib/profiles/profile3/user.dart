class User {
  String name;
  String adresse;
  String about;

  User({this.name, this.adresse, this.about});
}

class Profile {
  User user;
  int following;
  int followers;
  int friends;

  Profile({this.user, this.following, this.followers, this.friends});
}
