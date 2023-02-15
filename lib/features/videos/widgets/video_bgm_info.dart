import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoBgmInfo extends StatelessWidget {
  const VideoBgmInfo({
    super.key,
    required String bgmInfo,
  }) : _bgmInfo = bgmInfo;

  final String _bgmInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '♫',
          style: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16,
          ),
        ),
        Gaps.h10,
        Expanded(
          child: Marquee(
            text: _bgmInfo,
            style: const TextStyle(
              color: Colors.white,
            ),
            blankSpace: 20,
            velocity: 20,
          ),
        ),
      ],
    );
  }
}
