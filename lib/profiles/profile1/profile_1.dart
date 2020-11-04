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
            body: Stack(
              children: [
                CustomPaint(
                  painter: ProfilePainter(),
                  child: Container(),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.22,
                  left: MediaQuery.of(context).size.width * 0.04,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: ExactAssetImage('assets/shared/yss.jpg'),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.34,
                    right: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile1.user.name,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey.shade400,
                              size: 20,
                            ),
                            Text(profile1.user.address),
                          ],
                        ),
                        SizedBox(height: 32),
                        Text(
                          "ABOUT ME",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              profile1.user.about,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                height: 1.3,
                                wordSpacing: 1.2,
                              ),
                            )),
                      ],
                    )),
                Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "FOLLOWERS",
                              style: _textStyle(),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              profile1.fllowers.toString(),
                              style: _counterBotomStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "FOLLOWING",
                              style: _textStyle(),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(profile1.fllowing.toString(), style: _counterBotomStyle),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "FRIENDS",
                              style: _textStyle(),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(profile1.friends.toString(), style: _counterBotomStyle),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      color: Colors.grey.shade500,
    );
  }

  TextStyle _counterBotomStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.grey.shade900);
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.38);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    //canvas.clipPath(path);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
