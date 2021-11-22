import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_flutter/Screens/Profile/editprofile.dart';
import 'package:project_flutter/Screens/Profile/helpPage.dart';
import 'package:project_flutter/Screens/Profile/historyPage.dart';
import 'package:project_flutter/Screens/forgotpassword_screen.dart';
import 'package:project_flutter/Screens/home_screen/home_screen.dart';
import 'package:project_flutter/Screens/home_screen_guest.dart';
import 'package:project_flutter/Screens/register_screen.dart';
import 'package:project_flutter/components/BottomGuest.dart';
import 'package:project_flutter/components/bottomLoggedin.dart';
import 'package:project_flutter/utilities/constant.dart';

import 'changepassword.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);


  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(80,0, 255, 255),
      //appBar: AppBar(
        //title: Text("Settings", style: TextStyle(fontSize: 22)),
        //leading: IconButton(
          //onPressed: () => Navigator.of(context).pop(true),
          //icon: Icon(
            //Icons.arrow_back,
            //color: Colors.white,
          //),
        //),
      //),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.person_pin_sharp,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text("Tùy chọn", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildAccountOption(
                context, "Đổi thông tin cá nhân",
                Icon(Icons.people_alt_rounded, color: Colors.grey,)
            ),
            buildHistoryPage(context, "Lịch sử tìm kiếm", Icon(Icons.history, color: Colors.grey,)),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text("Tài khoản & Hỗ trợ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildChangePwd(context, "Đổi mật khẩu", Icon(Icons.password_outlined, color: Colors.grey,)),
            buildHelpPage(context, "Trợ giúp", Icon(Icons.help, color: Colors.grey,)),
            buildLogout(context, "Đăng xuất", Icon(Icons.logout, color: Colors.grey,)),
          ],
        ),
      ),
    );
  }

  onPressHander()  {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditProfileScreen()),
    );
  }


  GestureDetector buildAccountOption(BuildContext context, String title, Icon icon) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
            padding: const EdgeInsets.all(20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: const Color(0xFFF5F6F9),
          ),
          onPressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfileScreen()),
            );
          },
          child: Row(
            children: [
              icon,
              const SizedBox(width: 20),
              Expanded(child: Text(title)),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildHistoryPage(BuildContext context, String title, Icon icon) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
            padding: const EdgeInsets.all(20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: const Color(0xFFF5F6F9),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HistoryPage()),
            );
          },
          child: Row(
            children: [
              icon,
              const SizedBox(width: 20),
              Expanded(child: Text(title)),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }


  GestureDetector buildChangePwd(BuildContext context, String title, Icon icon) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
            padding: const EdgeInsets.all(20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: const Color(0xFFF5F6F9),
          ),
          onPressed:() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChangPwdScreen()),
            );
          },
          child: Row(
            children: [
              icon,
              const SizedBox(width: 20),
              Expanded(child: Text(title)),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  void Logout() {
    //final state = Provider.of<User>(context, listen: false);
    //state.username = controller.text;
    Navigator.of(context).pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Thông báo !!!')),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : <Widget>[
              Expanded(
                child: Text(
                  'Bạn đã thay đổi thông tin cá nhân thành công !',
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

  GestureDetector buildLogout(BuildContext context, String title, Icon icon) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
            padding: const EdgeInsets.all(20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: const Color(0xFFF5F6F9),
          ),
          onPressed: onWillPop,
          child: Row(
            children: [
              icon,
              const SizedBox(width: 20),
              Expanded(child: Text(title)),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildHelpPage(BuildContext context, String title, Icon icon) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
            padding: const EdgeInsets.all(20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: const Color(0xFFF5F6F9),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HelpPage()),
            );
          },
          child: Row(
            children: [
              icon,
              const SizedBox(width: 20),
              Expanded(child: Text(title)),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ĐĂNG XUẤT?'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.redAccent,
        ),
        content: Text('Bạn có chắc chăn muốn đăng xuất không?'),
        actions: <Widget>[
          FlatButton(
            color: Colors.red,
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Không'),
          ),
          FlatButton(
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigationBarGuest()),
              );
            },
            child: Text('Có'),
          ),
        ],
      ),
    );
    return shouldPop ?? false;
  }

}