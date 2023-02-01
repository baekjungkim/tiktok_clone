import 'package:flutter/material.dart';

void main() {
  runApp(const TicktokApp());
}

class TicktokApp extends StatefulWidget {
  const TicktokApp({super.key});

  @override
  State<TicktokApp> createState() => _TicktokAppState();
}

class _TicktokAppState extends State<TicktokApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticktok Clone',
      theme: ThemeData(
        primaryColor: const Color(0xffe9435a),
      ),
      home: Container(),
    );
  }
}
