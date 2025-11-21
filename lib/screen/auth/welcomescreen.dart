import 'package:flutter/material.dart';
import 'package:meal/screen/auth/loginscreen.dart';
import 'package:meal/screen/auth/signupscreen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    Widget mainContent() {
      return Column(
        children: [
          Image.asset(
            'assets/image/uppagetwo.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),
          const Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xff64C3BF),
            ),
          ),
          const Text(
            'Find Your Food that you Love!',
            style: TextStyle(fontSize: 19),
          ),
          const SizedBox(height: 80),
          Image.asset(
            'assets/image/centerpagetwo.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 60),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const SignUpScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff64C3BF),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 90),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LogInScreen()),
              );
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 103),
              side: const BorderSide(color: Color(0xFF6EC9C7), width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Color(0xFF6EC9C7),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: isLandScape
          ? SingleChildScrollView(child: mainContent())
          : mainContent(),
    );
  }
}
