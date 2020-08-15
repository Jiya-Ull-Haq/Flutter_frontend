import 'package:assignment/Utilities/Animation.dart';
import 'package:assignment/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import 'Login_Screen.dart';



class RegisterScreen extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<RegisterScreen> {

  Widget _buildBanner() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]); // To hide the device UI which shows Battery life, etc...
    return FadeAnimation(
      1.6, Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(64),
            right: ScreenUtil().setWidth(102),
            left: ScreenUtil().setWidth(103),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/Logo/Logo@3x.png'),
            ],
          ),
        )
      ],
    ),
    );
  }

  Widget _buildemailtxt() {
    return Container(
      width: ScreenUtil().setWidth(296),
      height: ScreenUtil().setHeight(52),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
              color: Color(0xff393E41)) //rgba(57, 62, 65, 1)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: HintTextStyle,
          hintText: 'Email Address',
          contentPadding: EdgeInsets.only(
            top: ScreenUtil().setHeight(16),
            right: ScreenUtil().setWidth(125),
            left: ScreenUtil().setWidth(21),
            bottom: ScreenUtil().setWidth(16),
          ),
        ),
      ),
    );
  }

  Widget _buildpasswordtxt() {
    return Container(
        width: ScreenUtil().setWidth(296),
        height: ScreenUtil().setHeight(52),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            border: Border.all(color: Color(0xff393E41))),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: HintTextStyle,
            hintText: 'Password',
            contentPadding: EdgeInsets.only(
                top: ScreenUtil().setHeight(16),
                right: ScreenUtil().setWidth(125),
                left: ScreenUtil().setWidth(21),
                bottom: ScreenUtil().setWidth(16)),
          ),
        ));
  }


  Widget _buildConfpasswordtxt() {
    return Container(
        width: ScreenUtil().setWidth(296),
        height: ScreenUtil().setHeight(52),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            border: Border.all(color: Color(0xff393E41))),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: HintTextStyle,
            hintText: 'Confirm Password',
            contentPadding: EdgeInsets.only(
                top: ScreenUtil().setHeight(16),
                right: ScreenUtil().setWidth(125),
                left: ScreenUtil().setWidth(21),
                bottom: ScreenUtil().setWidth(16)),
          ),
        ));
  }
  Widget _buildRegisterButton(){
    return
      Container(
        width: ScreenUtil().setWidth(296),
        height: ScreenUtil().setHeight(56),
        child: RaisedButton(
          onPressed: () {print('Register Button Clicked');},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
          padding: EdgeInsets.all(0.0),

          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xffEF5A53), Color(0xffF48348),Color(0xffF48348)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(45.0)
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: 500.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: LabelStyle
              ),
            ),
          ),
        ),
      );
  }

  Widget _buildLoginForm() {
    return FadeAnimation(
      1.6, Column(
      children: <Widget>[
        _buildemailtxt(),
        SizedBox(height: ScreenUtil().setHeight(13)),
        _buildpasswordtxt(),
        SizedBox(height: ScreenUtil().setHeight(13)),
        _buildConfpasswordtxt(),
        SizedBox(height: ScreenUtil().setHeight(13)),
        _buildRegisterButton(),
        SizedBox(height: ScreenUtil().setHeight(13)),
        FlatButton(

          onPressed: () => print('Terms and conditions Clicked'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You agree to all",//terms and condition.
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontSize: 14.0),
              ),
              Text(
                " terms and condition.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontSize: 14.0),
              ),
            ],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(13)),
        FlatButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage())),
          child: Text(
            "Already have an account",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksandd',
                fontWeight: FontWeight.w700,
                fontSize: 16.0),
          ),
        )
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
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildBanner(),
              SizedBox(height: ScreenUtil().setHeight(45)),
              _buildLoginForm(),

            ],
          ),
        ),
      ),
    );
  }
}
