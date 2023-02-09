import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreenFirst extends StatelessWidget {
  const TutorialScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Gaps.v80,
        Text(
          'Watch cool videos!',
          style: TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        Text(
          'Videos ar personalized for you based on what you watch, like, and share.',
          style: TextStyle(
            fontSize: Sizes.size24,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
