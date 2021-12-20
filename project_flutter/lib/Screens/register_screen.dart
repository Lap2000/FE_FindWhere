//import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_flutter/Config/config.dart';
import 'package:project_flutter/utilities/constant.dart';


import 'forgotpassword_screen.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final controller_email = TextEditingController();
  final controller_userPwd = TextEditingController();
  final controller_confirmPassword = TextEditingController();
  final controller_name = TextEditingController();
  final controller_userName = TextEditingController();

  bool _validate = false;

  //Fetch http request Register
  void fetchRegister() async {
    var config = host_uri();
    final url = Uri.parse(config+'user/register');
    var response = await http.post(
        url,
        headers: {
          'Accept' : 'application/json'
        },
        body:{
          'userName': controller_userName.text,
          'userPwd': controller_userPwd.text,
          'confirmPassword': controller_confirmPassword.text,
          'name': controller_name.text,
          'email': controller_email.text,
        }
    );

    //final Map parsed = json.decode(response.body);
    //final signUp = fromJson(parsed);
    //response.fromJson(Map<String,dynamic>json);
    var res = json.decode(response.body);
    if (response.statusCode == 200) {
      //print(jsonDecode(res));
      //RegisterButton(jsonDecode(res)['message'].toString());
    } else {
      // List<dynamic> jsonData =
      // jsonDecode(response.body)['message'];
      //RegisterButton(res.message);
      //print(res.message);
      print(res);
    }
  }

  //Khởi tạo
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller_userName.dispose();
    controller_userPwd.dispose();
    controller_confirmPassword.dispose();
    controller_name.dispose();
    controller_email.dispose();
    //Login();
    //_makePostRequest();
    super.dispose();
  }

  // List Component RegisterPage
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
            controller: controller_name,
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
              // errorText: _validate ? 'Value Can\'t Be Empty' : null,
              // errorStyle: TextStyle(
              //   fontSize: 14.0,
              // ),
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
            controller: controller_email,
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
            controller: controller_userName,
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
            controller: controller_userPwd,
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
            controller: controller_confirmPassword,
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

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () =>{
        setState(() {
        controller_name.text.isEmpty ? _validate = true : _validate = false;
        }),
          fetchRegister()
          //RegisterButton("heloo")
        },
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

  //Dialog sau khi bấm nút Đăng ký
  //Dialog Save OK ? Cancle
  Future<bool> RegisterButton(String message) async {
    //final state = Provider.of<User>(context, listen: false);
    //state.username = controller.text;
    //Navigator.of(context).pop();
    final shouldPop = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                  width: 5,
                  color: Colors.greenAccent
              )
          ),
          title: Center(child: Text(
            'Thông báo !',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22.0,
              fontFamily: 'helvetica_neue_light',
            ),
            textAlign: TextAlign.center,
          ),),
          content: new Container(
            width: 60.0,
            height: 100.0,
            // decoration: new BoxDecoration(
            //   shape: BoxShape.rectangle,
            //   color: const Color(0xFFFFFF),
            //   borderRadius: new BorderRadius.all(new Radius.circular(35.0)),
            //   ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Expanded(
                child: new Row(
                  children: <Widget>[
                    new Container(
                    child: new Text(
                      'Bạn đã đăng ký thành công !',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'helvetica_neue_light',
                          ),
                      textAlign: TextAlign.center,
                        ),
                      ),
                    ],),
                  ),
                SizedBox(
                  height: 10.0,
                ),
                new InkWell(
                  onTap: () {Navigator.of(context).pop(false);},
                  child: new Container(
                    padding: new EdgeInsets.all(14.0),
                    decoration: new BoxDecoration(
                      color: const Color(0xFF33b17c),
                        borderRadius: new BorderRadius.all(new Radius.circular(35.0)),
                    ),
                    child: new Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ],),
              ),

          // actions: <Widget>[
          //   FlatButton(
          //       child: Text('OK'),
          //       color: Colors.greenAccent,
          //       onPressed: () {
          //         Navigator.of(context).pop(false);
          //         //ChangeProfile();
          //         //Navigator.of(context).pop(true);
          //         // Navigator.push(
          //         //   context,
          //         //   MaterialPageRoute(
          //         //       builder: (context) => LoginScreen()),
          //         // );
          //       })
          // ],
        );
      },
    );
    return shouldPop ?? false;
  }

  //Build RegisterPage
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
                  _buildRegisterBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}