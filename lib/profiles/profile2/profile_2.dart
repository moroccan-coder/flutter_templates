import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'UbuntuFont',
      ),
      child: Stack(
        children: [
          Image.asset("assets/profiles/back_bg2.jpg",fit: BoxFit.cover,height: MediaQuery.of(context).size.height * 0.44,),
          Scaffold(
           backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.bars),
                onPressed: (){},
              ),
            ),
            
            body: Stack(
              children: [
                _profileTitle(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _profileTitle(BuildContext context) {

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.3)
                  ),
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
            )
          ],
        ));
  }
}
