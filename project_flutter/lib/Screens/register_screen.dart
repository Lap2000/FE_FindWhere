import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_flutter/utilities/constant.dart';

import 'forgotpassword_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  Widget _buildFullNameBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Họ và tên',
          style: kLabelStyle,
        ),
        SizedBox(height: 8.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child:  TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.face_unlock_sharp,
                color: Colors.white,
              ),
              hintText: "Enter your Full Name",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildEmailBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 8.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child:  TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "Enter your Email",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildUsernameBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 8.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child:  TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "Enter your Username",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildPassBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 8.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child:  TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "Enter your Password",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildConfirmPassBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 8.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child:  TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.lock_clock,
                color: Colors.white,
              ),
              hintText: "Confirm your Password",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildForgotPwdTextBtn() {
    return Container(
      alignment: Alignment.centerLeft,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForgotPwdScreen()),
          );
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Quên mật khẩu ?',
          style: kLabelButtonStyle,
        ),
      ),
    );
  }

  Widget _buildLoginTextBtn() {
    return Container(
      alignment: Alignment.topLeft,
      child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen()),
            );
          },
          padding: EdgeInsets.only(right: 0.0),
      child: Text(
        'Bạn đã có tài khoản ? Hãy đăng nhập !',
        style: kLabelButtonStyle,
      ),
    ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'ĐĂNG KÝ',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    //Color(0xFF73AEF5),
                    //Color(0xFF61A4F1),
                    //Color(0xFF478DE0),
                    //Color(0xFF398AE5),
                    Color.fromARGB(100,0, 133, 255),
                    Color.fromARGB(80,0, 255, 255),
                  ],
                  stops: [0.7, 0.9],
                  //stops: [0.1, 0.4, 0.7, 0.9],
                )
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _buildFullNameBox(),
                  SizedBox(height: 10.0),
                  _buildEmailBox(),
                  SizedBox(height: 10.0),
                  _buildUsernameBox(),
                  SizedBox(height: 10.0),
                  _buildPassBox(),
                  SizedBox(height: 10.0),
                  _buildConfirmPassBox(),
                  _buildForgotPwdTextBtn(),
                  _buildLoginTextBtn(),
                  _buildLoginBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}