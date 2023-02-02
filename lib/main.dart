import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/sign_up/sign_up_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatefulWidget {
  const TiktokApp({super.key});

  @override
  State<TiktokApp> createState() => _TiktokAppState();
}

class _TiktokAppState extends State<TiktokApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ticktok Clone',
        theme: ThemeData(
          primaryColor: const Color(0xffe9435a),
        ),
        home: const SignUpScreen());
  }
}
