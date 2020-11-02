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
    return Theme(
      data: ThemeData(
        fontFamily: 'UbuntuFont',
      ),
      child: Stack(
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
                icon: FaIcon(
                  FontAwesomeIcons.bars,
                ),
                onPressed: () {},
              ),
              actions: [IconButton(icon: FaIcon(FontAwesomeIcons.cog), onPressed: () {})],
              backgroundColor: Colors.transparent,
              title: Text(
                "PROFILE",
              ),
              elevation: 0,
              centerTitle: true,
            ),
          ),
          CustomPaint(
            painter: ProfilePainter(),
            child:Container(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
            left: MediaQuery.of(context).size.width * 0.04,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: ExactAssetImage('assets/shared/yss.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.36);
    path.lineTo(size.width, size.height * 0.43);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    //canvas.clipPath(path);
    canvas.drawPath(path,paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
