import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreenSecond extends StatelessWidget {
  const TutorialScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Gaps.v80,
        Text(
          'Follow the rules of the app',
          style: TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        Text(
          'Take care of one another!',
          style: TextStyle(
            fontSize: Sizes.size24,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
