import 'package:flutter/material.dart';


// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

//Styles that we use in our app
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kLabelButtonStyle = TextStyle(
  decoration: TextDecoration.underline,
  decorationThickness: 2,
  color: Color.fromARGB(1000,0, 133, 255),
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);


final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.white54,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);