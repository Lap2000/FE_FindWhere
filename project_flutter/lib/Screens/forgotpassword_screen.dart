import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_flutter/components/BottomGuest.dart';
import 'package:project_flutter/Screens/login_screen.dart';
import 'package:project_flutter/Screens/register_screen.dart';
import 'package:project_flutter/utilities/constant.dart';

class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({Key? key}) : super(key: key);

  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {

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
          'B???n ???? nh??? ra m???t kh???u ? H??y ????ng nh???p !',
          style: kLabelButtonStyle,
        ),
      ),
    );
  }

  Widget _buildForgotSendEmailBtn() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 5.0,
            onPressed: () => print('Send Button Pressed'),
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
            child: Text(
              'G???I',
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

  Widget _buildReturnHomeBtn() {
    return Container(
      alignment: Alignment.topRight,
      child: RawMaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavigationBarGuest()),
          );
        },
        elevation: 2.0,
        fillColor: Colors.white,
        child: Icon(
          Icons.keyboard_return,
          size: 25.0,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      )
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
                _buildReturnHomeBtn(),
                Text(
                  'Please enter your Email !',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                _buildEmailBox(),
                _buildLoginTextBtn(),
                _buildForgotSendEmailBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}