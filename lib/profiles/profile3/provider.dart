import 'package:flutter_ui/profiles/profile3/user.dart';

class ProfileProvider{


  static Profile getProfile(){

    return Profile(user:  User(
        name: "YASSINE EL HAITAR", adresse: "Oulad Teima Taroudant", about: "Smile spoke total few great had never their too. Amongst moments do in arrived at my replied. Fat weddings servants but man believed prospect. Companions understood is as especially pianoforte connection introduced. Nay newspaper can sportsman are admitting gentleman belonging his. "),
      followers: 500000,
      following: 210,
      friends: 540,);

  }

}