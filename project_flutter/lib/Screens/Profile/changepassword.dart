import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangPwdScreen extends StatefulWidget {
  @override
  _ChangPwdState createState() => _ChangPwdState();
}


class _ChangPwdState extends State<ChangPwdScreen> {
  bool showPassword = false;
  int _gender = 0;

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
              buildTextField("Mật khẩu cũ","Nhập mật khẩu cũ"),
              buildTextField("Mật khẩu mới","Nhập mật khẩu mới"),
              buildTextField("Xác nhận mật khẩu mới","Nhập lại mật khẩu mới"),
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
                    onPressed: saveUser,
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

  void saveUser() {
    //final state = Provider.of<User>(context, listen: false);
    //state.username = controller.text;
    Navigator.of(context).pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Thông báo !')),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : <Widget>[
              Expanded(
                child: Text(
                  'Bạn đã thay đổi mật khẩu thành công !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,

                  ),
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Ok'),
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.of(context).pop(true);
                })
          ],
        );
      },
    );
  }

  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = true;
  }

  Widget buildTextField(
      String labelText, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
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