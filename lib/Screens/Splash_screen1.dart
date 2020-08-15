import 'package:assignment/Utilities/Animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import 'Splash_screen2.dart';

class Splash_Screen1 extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<Splash_Screen1> {
  Widget _buildBanner() {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom
    ]); // To hide the device UI which shows Battery life, etc...



    return FadeAnimation(
      1.6,
      Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(230),
              right: ScreenUtil().setWidth(143),
              left: ScreenUtil().setWidth(143),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/Logo/sync-logo@3x.png'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return FadeAnimation(
      1.6,
      Column(
        children: <Widget>[
          _buildBanner(),
          Text(
            'Sync',
            style: TextStyle(
              fontSize: 72,
              fontFamily: 'Quicksandd',
              color: Colors.white,
              fontStyle: FontStyle.normal,
            ),
          ),
          Text(
            'the meeting app',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Quicksand',
                color: Colors.white,
                fontStyle: FontStyle.normal),

          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
    ScreenUtil(width: 360, height: 640, allowFontScaling: true)
      ..init(context);
    return Scaffold(
      backgroundColor: Colors.orange,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Splash_Screen2()));
        },
        child: Stack(
          children: <Widget>[
            Container(
              //Main Body(Wall paper)

                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFEF5A53),
                      Color(0xFFF48348),
                    ],
                    stops: [0.1, 0.9],
                  ),
                )),
            _buildLogo(),

          ],
        ),
      ),
    );
  }
}
