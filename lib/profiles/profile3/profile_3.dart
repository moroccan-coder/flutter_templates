import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile3/provider.dart';
import 'package:flutter_ui/profiles/profile3/user.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile profile3 = ProfileProvider.getProfile();

 List<String> _photosList = [
   'assets/shared/nature/nature3.jpg',
   'assets/shared/nature/nature4.jpg',
   'assets/shared/nature/nature5.jpg',
   'assets/shared/nature/nature1.jpg',
   'assets/shared/nature/nature2.jpg',
   'assets/shared/nature/nature6.jpg',
   'assets/shared/nature/nature7.jpg',
   'assets/shared/nature/nature8.jpg',
 ];

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
                padding: const EdgeInsets.only(top: 8,bottom: 24),
                child: Text(profile3.user.adresse,textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.grey.shade800
                ),),
              ),
              _followButton(context),
              _divider(),
              _counters(context),
              _divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("PHOTOS (${profile3.photos.toString()})",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade700
                ),),
              ),
              _photos(context),
              ..._aboutMe(),
              _friends(),
              _contacts(context),

            ],
          ),
        ));
  }

  List<Widget> _aboutMe() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 24,left: 16),
        child: Text("ABOUT ME",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
        child: Text(profile3.user.about,style: TextStyle(
            fontSize: 16,color: Colors.grey.shade700

        ),

        ),
      ),

    ];
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
    return TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.grey.shade900);
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

  Widget _photos(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 100,
      child: ListView(
        children: List.generate(_photosList.length, (index) {
          return Container(
            margin: EdgeInsets.only(left: 8,right: 8),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(_photosList[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          );
        }).toList(),
        scrollDirection: Axis.horizontal,
      ),
    );

  }


  Widget _friends(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Text('FRIENDS(${profile3.friends.toString()})',style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold
      ),),
    );
  }

  Widget _contacts(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 24),
      height: 60,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(_contactsPic.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage(_contactsPic[index]),
                radius: 30,
              ),
            );
          }).toList(),
        ),
    )
    ;
  }
}
