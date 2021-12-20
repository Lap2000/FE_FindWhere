import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:project_flutter/Config/config.dart';
import 'package:project_flutter/Screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}


class _EditProfileState extends State<EditProfileScreen> {
  bool showPassword = false;
  late double current_lat = 0;
  late double current_lng = 0;
  //int _gender = 0;

  //Controller sử dụng
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerDateofBirth = TextEditingController();
  final controllerLocation = TextEditingController();

  //Biến sử dụng
  //late bool isLog = false;
  late String status = "a";
  late String userName = "";
  late String name = "";
  late String email = "";
  late String phone = "";
  late DateTime dateofBirth = DateTime.now();
  late int gender = 0;
  late bool isPicked = false;


  //Request Get Device's Location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  //Khởi tạo
  @override
  void initState() {
    GetUsers_Profile();
    _displayCurrentLocation();
    _determinePosition();
    super.initState();
  }


  //Get Current Location User
  void _displayCurrentLocation() async {
    final _location  = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    current_lat = _location.latitude;
    current_lng = _location.longitude;
  }


  //Fetch http request get user's profile
  void GetUsers_Profile() async {
    var config = host_uri();
    final url = Uri.parse(config+'user/findUserByToken');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('apiToken').toString();
    print(prefs.getString('apiToken'));
    var response = await http.get(
        url,
        headers:{
          "Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json",
          "Authorization": 'Basic $token',
          //HttpHeaders.contentTypeHeader: 'application/json',
          //HttpHeaders.authorizationHeader: token.toString(),
        }
    );
    var res = response.body;
    if (response.statusCode == 200) {
      print(jsonDecode(res)['data']);
      setState(() {
        userName = jsonDecode(res)['data']['userName'];
        name = jsonDecode(res)['data']['name'];
        email = jsonDecode(res)['data']['email'];
        phone = jsonDecode(res)['data']['phone'];
        dateofBirth = DateTime.tryParse(jsonDecode(res)['data']['dateofBirth'])!;
        gender = jsonDecode(res)['data']['gender'];
      });
    } else {
      print(response.statusCode);
    }
    //print();
    //print('Token : ${token}');
  }


  void ChangeProfile() async {
    var config = host_uri();
    final url = Uri.parse(config+'user/changeInfo');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('apiToken').toString();
    //print(prefs.getString('apiToken'));
    String name_user = "";
    String email_user = "";
    String phone_user = "";
    DateTime dob_user = DateTime.now();

    if(controllerName.text == "") {
      name_user = name;
    }
    else name_user = controllerName.text;

    if(controllerEmail.text == "") {
      email_user = email;
    }
    else email_user = controllerEmail.text;

    if(controllerPhone.text == "") {
      phone_user = phone;
    }
    else phone_user = controllerPhone.text;

    if(controllerDateofBirth.text == "") {
      dob_user = dateofBirth;
    }
    else dob_user = DateTime.tryParse(controllerDateofBirth.text)!;


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
          'name': name_user,
          'email': email_user,
          'phone': phone_user,
          'gender': gender.toString(),
          'dateofBirth': selectedDate.toString(),
        }
    );
    var res = response.body;
    if (response.statusCode == 200 || response.statusCode == 400) {
      //print(jsonDecode(res)['data']);
      Save_Dialog();
      print(jsonDecode(res));
    } else {
      print(response.statusCode);
    }
    //print();
    //print('Token : ${token}');
  }


  //Build Page Editprofile
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
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Họ và tên", name, false,controllerName, true),
              buildTextField("E-mail", email, false, controllerEmail, true),
              buildTextField("Số điện thoại", phone, false, controllerPhone, true),
              buildDropDownList(),
              //buildTextField("Giới tính", "Nam", false),
              buildCalendarPicker(),
              //buildTextField("Ngày sinh", "30/03/2000", false),
              buildTextField("Vị trí", current_lat.toString() + " , " + current_lng.toString(), false, controllerLocation, false),
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
                    onPressed: ChangeProfile,
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
                          '     Chỉnh sửa thành công !',
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

  //Dialog Save OK ? Cancle
  // void saveUser() {
  //   //final state = Provider.of<User>(context, listen: false);
  //   //state.username = controller.text;
  //   Navigator.of(context).pop();
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Center(child: Text('Thông báo !!!')),
  //         content: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children : <Widget>[
  //             Expanded(
  //               child: Text(
  //                 'Bạn đã thay đổi thông tin cá nhân thành công !',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: Colors.red,
  //
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //               child: Text('Ok'),
  //               color: Colors.greenAccent,
  //               onPressed: () {
  //                 ChangeProfile();
  //                 Navigator.of(context).pop(true);
  //               })
  //         ],
  //       );
  //     },
  //   );
  // }

  //Dialog OK ? Cancle

  // Future<bool> onWillPop() async {
  //   final shouldPop = await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Are you sure?'),
  //       content: Text('Do you want to leave without saving?'),
  //       actions: <Widget>[
  //         FlatButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: Text('No'),
  //         ),
  //         FlatButton(
  //           onPressed: () => Navigator.of(context).pop(true),
  //           child: Text('Yes'),
  //         ),
  //       ],
  //     ),
  //   );
  //   return shouldPop ?? false;
  // }

  //Tên, Email, Số điện thoại
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField, TextEditingController controller, bool enable) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            enabled: enable,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  //Giới tính
  String dropdownValue = "Nam";
  Widget buildDropDownList() {
    if(gender == 0) {
    }
    else dropdownValue = "Nữ";
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        elevation: 16,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        underline: Container(
          height: 1,
          color: Colors.black45,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            if(dropdownValue =="Nam") {
              gender = 0;
            }
            else gender = 1;
          });
        },
        items: <String>['Nam', 'Nữ']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )
    );
  }

  //Khởi tạo bộ lịch
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1975,8),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate)
      setState(() {
        isPicked = true;
        selectedDate = picked;
      });
  }

  //Ngày sinh
  Widget buildCalendarPicker() {
    if (!isPicked)
      {
        selectedDate = dateofBirth;
      }
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: controllerDateofBirth,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2),
                labelText: "Ngày sinh",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabled: true,
                hintText: "${selectedDate.toLocal()}".split(' ')[0],
                //hintText: "${dateofBirth.toLocal()}".split(' ')[0],
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today_rounded),
                  color: Colors.grey,
                  onPressed: () => _selectDate(context),
                  ),
            ),
          ),
          //Text("${selectedDate.toLocal()}".split(' ')[0]),
          SizedBox(height: 20.0,),
        ],
      ),
      //child: Text("Selected Date: $selectedDate"),
    );
  }
}