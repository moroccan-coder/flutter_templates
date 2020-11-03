import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/profiles/profile2/provider.dart';
import 'package:flutter_ui/profiles/profile2/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  Profile profile = ProfileProvider.getProfile();

  List<String> _contactsPic = [
    "assets/shared/persons/pers1.jpg",
    "assets/shared/persons/pers2.jpg",
    "assets/shared/persons/pers3.jpg",
    "assets/shared/persons/pers4.jpg",
    "assets/shared/persons/pers5.jpg",
    "assets/shared/persons/pers6.jpg",
    "assets/shared/persons/pers7.jpg",
    "assets/shared/persons/pers8.jpg",
    "assets/shared/persons/pers9.jpg",
    "assets/shared/persons/pers10.jpg",
    "assets/shared/persons/pers11.jpg",
    "assets/shared/persons/pers12.jpg",
    "assets/shared/persons/pers13.jpg",
    "assets/shared/persons/pers14.jpg",
    "assets/shared/persons/pers15.jpg",
    "assets/shared/persons/pers16.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'UbuntuFont',
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/profiles/back_bg2.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.44,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.bars),
                onPressed: () {},
              ),
            ),
            body: Stack(
              children: [
                _profileTitle(context),
                _bodyContent(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _profileTitle(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.02,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 94,
                  width: 94,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: ExactAssetImage("assets/shared/yss.jpg"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                profile.user.name,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              profile.user.adresse,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ));
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.32,
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _counters(context),
                _divider(),
                ..._aboutMe(),
                _friends(),
                _contacts(context),
              ],
            ),
          ),
        ));
  }

  TextStyle _textStyle = TextStyle(
    color: Colors.grey.shade500,
  );

  TextStyle _counterNumersStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade700);
  }

  Widget _counters(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "FOLLOWERS",
              style: _textStyle,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              profile.followers.toString(),
              style: _counterNumersStyle(),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "FOLLOWING",
              style: _textStyle,
            ),
            SizedBox(
              height: 4,
            ),
            Text(profile.following.toString(), style: _counterNumersStyle()),
          ],
        ),
        Column(
          children: [
            Text(
              "FRIENDS",
              style: _textStyle,
            ),
            SizedBox(
              height: 4,
            ),
            Text(profile.friends.toString(), style: _counterNumersStyle()),
          ],
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  List<Widget> _aboutMe() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        child: Text("ABOUT ME",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(profile.user.about,style: TextStyle(
          fontSize: 16,color: Colors.grey.shade700
        ),),
      ),

    ];
  }
  Widget _friends(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      child: Text('FRIENDS(${profile.friends.toString()})',style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.bold
      ),),
    );
  }

  Widget _contacts(BuildContext context) {

    return Flexible(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(16, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(_contactsPic[index]),
              radius: 30,
            ),
          );
        }).toList(),
      ),
    );
  }
}
