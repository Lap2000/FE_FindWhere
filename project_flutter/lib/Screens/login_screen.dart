import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_flutter/Config/config.dart';
//import 'package:http/http.dart';
import 'package:project_flutter/Screens/forgotpassword_screen.dart';
import 'package:project_flutter/Screens/register_screen.dart';
import 'package:project_flutter/components/BottomGuest.dart';
import 'package:project_flutter/components/bottomLoggedin.dart';
import 'package:project_flutter/utilities/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  late bool isLog = false;
  late String status = "a";

  //Fetch http request Login get token
  void fetchLogin() async {
    var config = host_uri();
    final url = Uri.parse(config+'user/login');
    var response = await http.post(
        url,
        headers: {
          'Accept' : 'application/json'
        },
        body:{
          'userName': controllerEmail.text,
          'userPwd': controllerPassword.text
        }
    );
    var res = response.body;
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('apiToken', jsonDecode(res)['data']);
      //print(jsonDecode(res)['data']);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerEmail.dispose();
    controllerPassword.dispose();
    //Login();
    //_makePostRequest();
    super.dispose();
  }

  //Http request : not use
  // _makePostRequest() async {
  //   // cài đặt tham số POST request
  //   String url = 'http://localhost:5000';
  //   Map<String, String> headers = {"Content-type": "application/json"};
  //   String json = '{"userName": controllerEmail.text, "userPwd": controllerPassword.text}';
  //   // tạo POST request
  //   Response response = await post(Uri.parse(url), headers: headers, body: json);
  //   // kiểm tra status code của kết quả response
  //   //int statusCode = response.statusCode;
  //   if (response.statusCode == 200) {
  //     isLog = true;
  //   } else {
  //     // If the server did not return a 201 CREATED response,
  //     // then throw an exception.
  //     throw Exception('Failed to Login.');
  //   }
  //   // API này trả về id của item mới được add trong body
  //   status = "response.statusCode.toString";
  //   String body = response.body;
  // }

  // Future<http.Response> fetchLogin(String username, String password) async {
  //   final response = await http.post(
  //     Uri.parse('https://localhost:5000'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'userName': controllerEmail.text,
  //       'userPwd': controllerPassword.text,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     // If the server did return a 201 CREATED response,
  //     // then parse the JSON.
  //     return http.Response(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 201 CREATED response,
  //     // then throw an exception.
  //     throw Exception('Failed to Login.');
  //   }
  // }

  // List Component LoginPage
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
            controller: controllerEmail,
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
  final _controllerEmail = TextEditingController();

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
            controller: controllerPassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
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
            onPressed: () async {
              fetchLogin();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              print(prefs.getString('apiToken'));
              Navigator.push(
                context,
                MaterialPageRoute(
                      builder: (context) => BottomNavigationBarLoggedIn()),
              );
              //print(Login());
            },
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => BottomNavigationBarLoggedIn()),
            //   );
            // },
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