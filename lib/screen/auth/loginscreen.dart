import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal/screen/auth/signupscreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    Future<void> submit() async {
      try {
        final firebaseauth = FirebaseAuth.instance;
        final valied = key.currentState!.validate();
        if (!valied) return;
        firebaseauth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passWordController.text,
        );
      } on FirebaseAuthException catch (e) {
        log(e.code);
      }
    }

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    Widget mainContent() {
      return Column(
        children: [
          Image.asset(
            'assets/image/uppagetwo.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff64C3BF),
            ),
          ),
          const SizedBox(height: 5),
          const Text('Log in', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 40),

          SizedBox(
            width: 266.47,
            height: 198.58,
            child: Image.asset('assets/image/Group11.png', fit: BoxFit.cover),
          ),
          Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (String? value) {
                          emailController.text = value!;
                        },
                        validator: (emailaddress) {
                          if (emailaddress == null ||
                              emailaddress.toString().trim().isEmpty ||
                              emailaddress.contains('@')) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'Email: ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusColor: const Color(0xff63c3bf),
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        onSaved: (String? value) {
                          emailController.text = value!;
                        },
                        validator: (emailaddress) {
                          if (emailaddress == null ||
                              emailaddress.toString().trim().isEmpty ||
                              emailaddress.contains('@')) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                        controller: passWordController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'password: ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusColor: const Color(0xff63c3bf),
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Text(
                          'Forget Password',
                          style: TextStyle(color: Color(0xff64c3bf)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff64C3BF),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 90,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),

                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
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
                    SizedBox(width: 3),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff64C3BF),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 23,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),

                  child: const Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t Have Account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Color(0xff64c3bf)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: isLandscape
          ? SingleChildScrollView(child: mainContent())
          : mainContent(),
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
