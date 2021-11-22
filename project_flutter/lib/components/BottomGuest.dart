import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/home_screen/home_screen.dart';
import 'package:project_flutter/Screens/home_screen_guest.dart';
import 'package:project_flutter/Screens/login_screen.dart';
import 'package:project_flutter/Screens/register_screen.dart';
import 'package:project_flutter/components/header.dart';

import '../Screens/forgotpassword_screen.dart';

class BottomNavigationBarGuest extends StatefulWidget {
  @override
  _BTBState createState() => _BTBState();
}

class _BTBState extends State<BottomNavigationBarGuest> {
  int currentIndex = 0;
  PageController pageController = PageController();

  setBottomBarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    //pageController.animateToPage(index,
    //duration: Duration(milliseconds: 1000),
    //curve: Curves.bounceIn);
  }

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.white,
        backgroundColor: Color.fromARGB(80,0, 255, 255),
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.usb_outlined, size: 30),
          Icon(Icons.verified_user, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
              child: HomeScreen(),
          ),
          Container(
            child: LoginScreen(),
          ),
          Container(
            child: RegisterScreen(),
          ),
        ],
      ),
    );
  }
}
