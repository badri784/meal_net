import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal/screen/auth/loginscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final userNameController = TextEditingController();
  final phoneNumerController = TextEditingController();
  final emailController = TextEditingController();
  final passwordontroller = TextEditingController();
  final conferirmPassController = TextEditingController();

  final globalkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    phoneNumerController.dispose();
    emailController.dispose();
    passwordontroller.dispose();
    conferirmPassController.dispose();
  }

  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    Future<void> submeit() async {
      final valid = globalkey.currentState!.validate();
      if (!valid) return;

      try {
        final UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordontroller.text,
            );

        if (user.user != null) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully')),
          );
        }
      } on FirebaseAuthException catch (e) {
        log(e.code);
        if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('invalid email please try another one'),
            ),
          );
        }
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('email is already in Just sign in')),
          );
        }
      }
    }

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
            SizedBox(height: 20.h),

            Text(
              'Create Account',
              style: TextStyle(fontSize: 30.sp, color: const Color(0xff4db4d1)),
            ),
            SizedBox(height: 7.h),
            const Text('Enter your Personal Data'),
            Form(
              key: globalkey,
              child: Padding(
                padding: const EdgeInsets.all(18).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: true,
                      onSaved: (newValue) {
                        userNameController.text = newValue!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'Please Enter valied UserName';
                        }
                        return null;
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xff63c3bf),
                            width: 2.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red, width: 2.w),
                        ),
                        labelText: 'User Name :',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15.h),

                    TextFormField(
                      validator: (value) {
                        if (value!.length < 5 || value.isEmpty) {
                          return 'Invalied Number';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        phoneNumerController.text = newValue!;
                      },
                      controller: phoneNumerController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xff63c3bf),
                            width: 2.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red, width: 2.w),
                        ),
                        labelText: 'Phone Numer :',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      validator: (String? value) {
                        if (!value!.contains('@') ||
                            value.trim().isEmpty ||
                            !value.endsWith('.com')) {
                          return 'Please enter valied email';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        emailController.text = newValue!;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xff63c3bf),
                            width: 2.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red, width: 2.w),
                        ),
                        labelText: 'Email :',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15.h),

                    TextFormField(
                      obscureText: obsecure,
                      validator: (value) {
                        if (passwordontroller.text !=
                            conferirmPassController.text) {
                          return 'Password Dosent Match';
                        }

                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must by at least 8 char';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        passwordontroller.text = newValue!;
                      },
                      controller: passwordontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xff63c3bf),
                            width: 2.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red, width: 2.w),
                        ),
                        labelText: 'Password :',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15.h),

                    TextFormField(
                      obscureText: obsecure,
                      validator: (value) {
                        if (passwordontroller.text !=
                            conferirmPassController.text) {
                          return 'Password Dosent Match';
                        }

                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must by at least 8 char';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        conferirmPassController.text = newValue!;
                      },
                      controller: conferirmPassController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                          icon: obsecure
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xff63c3bf),
                            width: 2.w,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red, width: 2.w),
                        ),
                        labelText: 'Confirem password:',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15.h),

                    ElevatedButton(
                      onPressed: submeit,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8).w,
                        backgroundColor: const Color(0xff64c3bf),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'By continuing you are agreeing our',
                  style: TextStyle(fontSize: 10),
                ),
                getbutton(),
                const Text(
                  'and our privacy polices',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(child: Divider()),
                SizedBox(width: 3),
                Text('or signup with google'),
                Expanded(child: Divider()),
                SizedBox(width: 3),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8).w,
                      backgroundColor: const Color(0xff64c3bf),
                    ),
                    child: Text(
                      'Continue with Google',
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an Account?'),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const LogInScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Color(0xff0d8ce9)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getbutton() {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: Text(
      'terms & conditions',
      style: TextStyle(color: const Color(0xff64c3bf), fontSize: 10.sp),
    ),
  );
}
