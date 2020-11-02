import 'package:flutter_ui/profiles/profile1/user.dart';

class Profile1Provider {
  static Profile getProfile() {
    return new Profile(
        user: new User(
            name: "YASSINE EL HAITAR",
            address: "Oulad Teima Taroudant",
            about:
                "Smile spoke total few great had never their too. Amongst moments do in arrived at my replied. Fat weddings servants but man believed prospect. Companions understood is as especially pianoforte connection introduced. Nay newspaper can sportsman are admitting gentleman belonging his. "),
        fllowers: 500000,
        fllowing: 3,
        friends: 10);
  }
}
