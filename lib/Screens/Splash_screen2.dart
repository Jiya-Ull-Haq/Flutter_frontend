import 'package:assignment/Screens/Login_Screen.dart';
import 'package:assignment/Utilities/Animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class Splash_Screen2 extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<Splash_Screen2> {
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

  Widget _buildGetstartedbtn(){
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(150),
        right: ScreenUtil().setWidth(30),
        left: ScreenUtil().setWidth(30),
        bottom: ScreenUtil().setWidth(30),
      ),
      width: ScreenUtil().setWidth(296),
      height: ScreenUtil().setHeight(56),
      child: RaisedButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        color: Colors.white,
        child: Text(
            "Get Started",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(16),
              fontFamily: 'Quicksandd',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            )
        )
      )
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

          _buildGetstartedbtn()
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
