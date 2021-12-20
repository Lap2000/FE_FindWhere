import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/Config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class ChangPwdScreen extends StatefulWidget {
  @override
  _ChangPwdState createState() => _ChangPwdState();
}


class _ChangPwdState extends State<ChangPwdScreen> {
  bool showPassword = false;
  int _gender = 0;

  //Controller sử dụng
  final controller_oldPassword = TextEditingController();
  final controller_newPassword = TextEditingController();
  final controller_confirmPassword = TextEditingController();



  void ChangePassword() async {
    var config = host_uri();
    final url = Uri.parse(config+'user/changePassword');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('apiToken').toString();
    //print(prefs.getString('apiToken'));

    var response = await http.post(
        url,
        headers:{
          "Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
          "Authorization": 'Basic $token',
          //HttpHeaders.contentTypeHeader: 'application/json',
          //HttpHeaders.authorizationHeader: token.toString(),
        },
        body:{
          'oldPassword': controller_oldPassword.text,
          'newPassword': controller_newPassword.text,
          'confirmPassword': controller_confirmPassword.text,
        }
    );
    var res = response.body;
    if (response.statusCode == 200) {
      //print(jsonDecode(res)['data']);
      Save_Dialog();
      print(jsonDecode(res));
    } else {
      print(response.statusCode);
      print(jsonDecode(res));
    }
    //print();
    //print('Token : ${token}');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Change Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Thay đổi mật khẩu ! "
                      "Bạn hãy bảo mật cẩn thận thông tin của mình !",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Mật khẩu cũ","Nhập mật khẩu cũ",controller_oldPassword),
              buildTextField("Mật khẩu mới","Nhập mật khẩu mới", controller_newPassword),
              buildTextField("Xác nhận mật khẩu mới","Nhập lại mật khẩu mới", controller_confirmPassword),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: ChangePassword,
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> Save_Dialog() async {
    //final state = Provider.of<User>(context, listen: false);
    //state.username = controller.text;
    Navigator.of(context).pop();
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
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Expanded(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'Đổi mật khẩu thành công !',
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
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
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
        );
      },
    );
    return shouldPop ?? false;
  }

  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget buildTextField(
      String labelText, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        //controller: _userPasswordController,
        obscureText: !_passwordVisible,//This will obscure text dynamically
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
          ),
          // Here is key idea
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

}