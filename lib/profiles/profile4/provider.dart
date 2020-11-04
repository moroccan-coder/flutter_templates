import 'package:flutter_ui/profiles/profile4/user.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
        user: User(
            name: "YASSINE EL HAITAR",
            profession: "Developer",
            about:
            "Smile spoke total few great had never their too. Amongst moments do in arrived at my replied."),
        followers: 500000,
        following: 210,
        friends: 540,);
  }
}
