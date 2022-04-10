import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'UI/Splash_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(372, 812),
      builder: (){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chap_Chop',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        );

      }
    );
  }
}




