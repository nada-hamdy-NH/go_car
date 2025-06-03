import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/features/forget_password/presentaion/screens/change_password.dart';
import 'package:go_car/features/forget_password/presentaion/screens/forget_password.dart';
import 'package:go_car/features/forget_password/presentaion/screens/forget_password_mobile_number.dart';
import 'package:go_car/features/home/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ForgetPasswordMobileNumber(),
      ),
    );
  }
}

