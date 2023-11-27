import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_http/Screens/HOME/View/HomeView.dart';

import '../Helper/Appdefault/Appdefault.dart';
import '../Helper/ScreenSize/ScreenSize.dart';
import 'LOGIN/View/LoginView.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MySplashPage();
  }
}

class MySplashPage extends StatefulWidget {
  @override
  _MysplashPageState createState() => _MysplashPageState();
}

class _MysplashPageState extends State<MySplashPage> {
  var token = "";
  @override
  void initState() {
    super.initState();
    getvalue();
    Future.delayed(const Duration(seconds: 1), () {
      if (token == "") {
        log('\nUser: $token');
        //navigate to home screen
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginView()));
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeView()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Icon(CupertinoIcons.smiley));
  }

  void getvalue() async {
    token = await AppDefault.shared.loadData('myString');
  }
}
