import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ Const/App_Colors.dart';
import 'Login_Screen.dart';
import 'User_Form.dart';

class RegistrationScreen extends StatefulWidget {
  //const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obsecureText = true;
  signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(context, CupertinoPageRoute(builder: (_) => UserForm()));
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Deep_Orange,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 150.h,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.light,
                        color: Colors.transparent,
                      )),
                  Text(
                    'SignUp',
                    style: TextStyle(fontSize: 22.sp, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.r),
                  topRight: Radius.circular(28.r)),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 22.sp, color: AppColors.Deep_Orange),
                    ),
                    Text(
                      "Again Buddy,Welcome Back",
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xFFBBBBBB)),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 41.w,
                          decoration: BoxDecoration(
                            color: AppColors.Deep_Orange,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 20.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintMaxLines: 40,
                              hintText: '*****@gmail.com',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xFF414041),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.Deep_Orange,
                              )),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 41.w,
                          decoration: BoxDecoration(
                            color: AppColors.Deep_Orange,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                              child: Icon(Icons.lock_outline,
                                  color: Colors.white, size: 20.w)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: TextField(
                          controller: _passwordController,
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                              hintText: 'Password must be 8 Character',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp, color: Color(0xFF414041)),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.Deep_Orange),
                              suffixIcon: _obsecureText == true
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obsecureText = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        size: 20.w,
                                      ))
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obsecureText = true;
                                        });
                                      },
                                      icon: Icon(Icons.visibility_off,
                                          size: 20.w))),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                      width: 1.sw,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          signUp();
                        },
                        child: Text(
                          'Continue',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.Deep_Orange,
                          elevation: 3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Don't have an Account",
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFBBBBBB)),
                        ),
                        GestureDetector(
                          child: Text('Sign In',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.Deep_Orange)),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
