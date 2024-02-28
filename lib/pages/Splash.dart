import 'package:flixify_movie_app/pages/Auth.dart';
import 'package:flixify_movie_app/palette/palette.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AuthPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          'Flixify',
          style: TextStyle(
            fontSize: 60,
            color: Palette.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ), // Replace with your splash screen asset
      ),
    );
  }
}
