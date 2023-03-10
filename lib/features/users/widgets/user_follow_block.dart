import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserFollowBlock extends StatelessWidget {
  const UserFollowBlock({
    super.key,
    required count,
    required title,
  })  : _count = count,
        _title = title;

  final String _count;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v3,
        Text(
          _title,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
