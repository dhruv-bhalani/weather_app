import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/gif/3.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
