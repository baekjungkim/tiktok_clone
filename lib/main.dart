import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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
      home: Padding(
        padding: const EdgeInsets.all(
          Sizes.size14,
        ),
        child: Container(
          child: Row(
            children: const [
              Text('hello'),
              Gaps.h20,
              Text('hello'),
            ],
          ),
        ),
      ),
    );
  }
}
