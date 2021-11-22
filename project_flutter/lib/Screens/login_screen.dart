import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_flutter/Screens/forgotpassword_screen.dart';
import 'package:project_flutter/Screens/register_screen.dart';
import 'package:project_flutter/components/BottomGuest.dart';
import 'package:project_flutter/components/bottomLoggedin.dart';
import 'package:project_flutter/utilities/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Widget _buildEmailBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white70,
              ),
              hintText: "Enter your Email",
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
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:  TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white70,
              ),
              hintText: "Enter your Password",
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

  Widget _buildRegisterTextBtn() {
    return Container(
      alignment: Alignment.topLeft,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterScreen()),
          );
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Bạn chưa có tài khoản ? Hãy đăng ký !',
          style: kLabelButtonStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 5.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigationBarLoggedIn()),
              );
            },
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
            child: Text(
              'ĐĂNG NHẬP',
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
                ),
              ),
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
                  Color.fromARGB(100,0, 133, 255),
                  Color.fromARGB(80,0, 255, 255),

                ],
                stops: [0.7, 0.9],
                //stops: [0.1, 0.4, 0.7, 0.9],
              )
            ),
          ),
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _buildEmailBox(),
                    SizedBox(height: 15.0),
                    _buildPassBox(),
                    _buildForgotPwdTextBtn(),
                    _buildRegisterTextBtn(),
                    _buildLoginBtn(),
                ],
              ),
            ),
        ],
      ),
      //bottomNavigationBar: BottomNavigationBarGuest(),
    );
  }
}