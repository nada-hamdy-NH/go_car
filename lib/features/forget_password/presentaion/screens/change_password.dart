import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_car/core/shared_widgets/custom_text_field.dart';
import 'package:go_car/core/shared_widgets/elevated_btn_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ForgetPasswordMobileNumberState();
}

class _ForgetPasswordMobileNumberState extends State<ChangePassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrimPasswordController =
      TextEditingController();
  bool isPasswordVisible = true;
  bool isConfrimPasswordVisible = true;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasUppercase = AppRegex.hasUppercase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(children: [
                  SizedBox(height: 70.h),
                  Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0D3244),
                  )),
                  SizedBox(height: 10.h),
                  Text(
                    "Your password must be at least 8 characters long \nand contain at least one letter and one digit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff121212)),
                  ),
                  SizedBox(height: 30.h),

                  //---------------------  password field ---------------------
                  CustomTextField(
                    controller: passwordController,
                    fieldTitle: 'Password',
                    isTextScure: isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF121212),
                      ),
                    ),
                    validator: (password) => AppRegex.isPasswordValid(password),
                  ),

                  //---------------------  confirm password field --------------
                  CustomTextField(
                    controller: confrimPasswordController,
                    fieldTitle: 'confirm Password',
                    isTextScure: isConfrimPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfrimPasswordVisible = !isConfrimPasswordVisible;
                        });
                      },
                      icon: isConfrimPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      color: const Color(0xFF121212),
                    ),
                    validator: (p0) {
                      if (p0 != passwordController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10.h),
                  Column(children: [
                    buildValidationRow(
                        "Between 8 and 20 characters", hasMinLength),
                    SizedBox(height: 2.h),
                    buildValidationRow(
                        "At least 1 uppercase letter", hasUppercase),
                    SizedBox(height: 2.h),
                    buildValidationRow("1 or more numbers", hasNumber),
                    SizedBox(height: 2.h),
                  ]),
                  SizedBox(height: 240.h),
                  CustomElevatedBtn(btnName: "Done", onPressed: () {}),
                ]))));
  }
}

Widget buildValidationRow(String text, bool haseValidated) {
  return Row(children: [
    CircleAvatar(
      radius: 8.r,
      backgroundColor: haseValidated ? Color(0xFF040404) : Color(0xFF475467),
      child: SvgPicture.asset("assets/svgs/check.svg" , width:11.25.w ,height: 11.25.h,),
    ),
    SizedBox(width: 6.w),
    Text(text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: haseValidated ? Color(0xFF040404) : Color(0xFF475467),
        )),
  ]);
}

class AppRegex {
  static bool isPasswordValid(String password) {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password);
  }

  static bool hasUppercase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8})').hasMatch(password);
  }
}
