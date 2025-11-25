import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal/screen/auth/loginscreen.dart';
import 'package:meal/screen/auth/signupscreen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/image/uppagetwo.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30.h),
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff64C3BF),
              ),
            ),
            Text(
              'Find Your Food that you Love!',
              style: TextStyle(fontSize: 19.sp),
            ),
            SizedBox(height: 80.h),
            Image.asset(
              'assets/image/centerpagetwo.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 60.h),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff64C3BF),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 90.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.r),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(height: 25.h),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LogInScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 103.w),
                side: BorderSide(color: const Color(0xFF6EC9C7), width: 2.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  color: const Color(0xFF6EC9C7),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
