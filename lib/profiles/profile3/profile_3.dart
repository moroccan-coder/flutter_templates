import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile3/provider.dart';
import 'package:flutter_ui/profiles/profile3/user.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile profile3 = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/profiles/back_bg3.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            actions: [
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          body: Stack(
            children: [
              _bodyContent(context),
              _profileImage(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Positioned(
        left: 12,
        right: 12,
        top: MediaQuery.of(context).size.height * .10,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
          child: ListView(
            children: [
              Text(profile3.user.name,style: TextStyle(
               fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 16),
                child: Text(profile3.user.adresse,textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.grey.shade800
                ),),
              ),
              _followButton(context),
              _divider(),
              _counters(context),
              _divider(),
            ],
          ),
        ));
  }

  Widget _profileImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.1 - 40,
      right: MediaQuery.of(context).size.width / 2 - 40,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: ExactAssetImage("assets/shared/yss.jpg"),
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    return Align(
      child: MaterialButton(
        onPressed: () {},
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
          "FOLLOW",
          style: TextStyle(color: Colors.white),
        )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }



  TextStyle _textStyle = TextStyle(
    color: Colors.grey.shade500,
  );

  TextStyle _counterNumersStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade700);
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
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
                profile3.followers.toString(),
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
              Text(profile3.following.toString(), style: _counterNumersStyle()),
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
              Text(profile3.friends.toString(), style: _counterNumersStyle()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.only(top: 8,bottom: 8),
      height: 1,
      color: Colors.grey.shade200,
    );
  }
}
