import 'package:flutter/material.dart';
import 'package:project_flutter/Screens/home_screen_guest.dart';
import 'package:project_flutter/components/BottomGuest.dart';
import 'package:project_flutter/Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarGuest(),
    );
  }
}

