import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal/screen/auth/welcomescreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final firebase = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(width: 220),
      appBar: AppBar(
        title: const Text('Meals'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await firebase.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Welcomescreen()),
              );
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
