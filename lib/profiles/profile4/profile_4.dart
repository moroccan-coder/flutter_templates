import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile4/provider.dart';
import 'package:flutter_ui/profiles/profile4/user.dart';

class Profile4 extends StatefulWidget {
  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  Profile profile4 = ProfileProvider.getProfile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/shared/me.jpg",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: [
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: _bodyCard(context),
          ),
        ),
      ],
    );
  }

  Widget _bodyCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .52,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topRow(context),
              ..._profile(context),

            ],
          ),

          Column(
            children: [
              _divider(),
              _counters(context),
            ],
          )

        ],
      ),
    );
  }

  Widget _topRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: ExactAssetImage("assets/shared/yss.jpg"),
            radius: 36,
            backgroundColor: Colors.transparent,
          ),
          Row(
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.lightBlue, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                onPressed: () {},
                child: Text(
                  'ADD FRIEND',
                  style: TextStyle(fontSize: 12,letterSpacing: 1.1),

                ),
              ),
              SizedBox(
                width: 8,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {},
                  child: Text(
                    'FOLLOW',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _profile(context)
  {
    return [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
         child: Text((profile4.user.name),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
       ),
       Padding(
         padding: const EdgeInsets.only(left: 16,bottom: 16),
         child: Text((profile4.user.profession),style: TextStyle(fontSize: 16,color: Colors.grey),),
       ),
       Padding(
         padding: const EdgeInsets.only(left: 16,right: 16),
         child: Text((profile4.user.about),style: TextStyle(fontSize: 16),),
       ),
    ];
  }



  TextStyle _textStyle = TextStyle(
    color: Colors.grey.shade500,
  );

  TextStyle _counterNumersStyle() {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.grey.shade900);
  }

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 8),
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
                profile4.followers.toString(),
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
              Text(profile4.following.toString(), style: _counterNumersStyle()),
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
              Text(profile4.friends.toString(), style: _counterNumersStyle()),
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
