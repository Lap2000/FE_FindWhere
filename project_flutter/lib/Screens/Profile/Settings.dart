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
import 'package:shared_preferences/shared_preferences.dart';

import 'changepassword.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //Build Setting Page
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
                Text("T??y ch???n", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildAccountOption(
                context, "?????i th??ng tin c?? nh??n",
                Icon(Icons.people_alt_rounded, color: Colors.grey,)
            ),
            buildHistoryPage(context, "L???ch s??? t??m ki???m", Icon(Icons.history, color: Colors.grey,)),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text("T??i kho???n & H??? tr???", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildChangePwd(context, "?????i m???t kh???u", Icon(Icons.password_outlined, color: Colors.grey,)),
            buildHelpPage(context, "Tr??? gi??p", Icon(Icons.help, color: Colors.grey,)),
            buildLogout(context, "????ng xu???t", Icon(Icons.logout, color: Colors.grey,)),
          ],
        ),
      ),
    );
  }

  //Redirect to EditProfilePage
  onPressHander()  {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditProfileScreen()),
    );
  }

  //Gesture Build AccountPage
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

  //Gesture Build HistoryPage
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

  //Gesture Build ChangePasswordPage
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

  //Function Logout
  void Logout() {
    //final state = Provider.of<User>(context, listen: false);
    //state.username = controller.text;
    Navigator.of(context).pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Th??ng b??o !!!')),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : <Widget>[
              Expanded(
                child: Text(
                  'B???n ???? thay ?????i th??ng tin c?? nh??n th??nh c??ng !',
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

  //Gesture Build Logout
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


  //Gesture Build HelpPage
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


  //Dialog OK? Cancle
  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
                width: 5,
                color: Colors.greenAccent
            )
        ),
        title: Center(child: Text(
          'Th??ng b??o !',
          style: TextStyle(
            color: Colors.red,
            fontSize: 22.0,
            fontFamily: 'helvetica_neue_light',
          ),
          textAlign: TextAlign.center,
        ),),
        content: new Container(
          width: 100.0,
          height: 120.0,
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
                        'B???n mu???n ????ng xu???t ?',
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
              new Expanded(
              child:
                new Row(
                children: <Widget>[
                  new InkWell(
                    onTap: () {
                      Navigator.of(context).pop(false);
                      },
                    child: new Container(
                      width: 100,
                      padding: new EdgeInsets.all(14.0),
                      decoration: new BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: new BorderRadius.all(new Radius.circular(35.0)),
                      ),
                      child: new Text(
                        'Cancle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'helvetica_neue_light',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  new InkWell(
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigationBarGuest()),
                      );
                    },
                    child: new Container(
                      width: 100,
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
            ],),
        ),
      ),
    );
    return shouldPop ?? false;
  }

}