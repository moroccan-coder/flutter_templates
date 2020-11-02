import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile1/provider.dart';
import 'package:flutter_ui/profiles/profile1/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile1 = Profile1Provider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/profiles/back_bg_1.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.45,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: FaIcon(FontAwesomeIcons.bars,color: Colors.white,),
              onPressed: (){

              },
            ),
            backgroundColor: Colors.transparent,
            title: Text("Profile"),
            elevation: 0,
            centerTitle: true,
          ),
        )
      ],
    );
  }
}
