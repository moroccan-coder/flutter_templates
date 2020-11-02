class User{

  String name,address,about;

  User({this.name, this.address, this.about});
}

class Profile{
  User user;
  int fllowers,fllowing,friends;

  Profile({this.user, this.fllowers, this.fllowing, this.friends});
}