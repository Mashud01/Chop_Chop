import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'package:chop_chop/%20Const/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Login_Screen.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => LoginScreen())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Deep_Orange,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Chop-Chop',
                  style: TextStyle(
                      color: Color(0xFFf7fafa),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold)),
              Icon(Icons.shopping_bag_sharp,
                  color: Color(0xFF344feb), size: 100.sp),
              SizedBox(
                height: 30.h,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
