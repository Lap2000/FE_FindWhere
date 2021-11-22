import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/Find/FindProducts.dart';
import 'package:project_flutter/Screens/Profile/Settings.dart';
import 'package:project_flutter/Screens/home_screen/home_screen.dart';
import 'package:project_flutter/Screens/home_screen/loggedhome_screen.dart';
import 'package:project_flutter/Screens/home_screen_guest.dart';
import 'package:project_flutter/Screens/login_screen.dart';
import 'package:project_flutter/Screens/register_screen.dart';
import 'package:project_flutter/components/header.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color.fromARGB(80,0, 255, 255),
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
                    Color.fromARGB(225, 26, 213, 160),
                    Color.fromARGB(247, 2, 246, 246),
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
                    'Chức năng này đang được bảo trì ! Quý khách hãy quay lại sau !',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
