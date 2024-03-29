import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoActionButton extends StatelessWidget {
  final IconData _icon;
  final String _text;
  final double _size;
  final Color _iconColor;

  const VideoActionButton({
    super.key,
    required icon,
    required text,
    size = Sizes.size40,
    iconColor = Colors.white,
  })  : _icon = icon,
        _text = text,
        _size = size,
        _iconColor = iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          _icon,
          color: _iconColor,
          size: _size,
        ),
        Gaps.v5,
        Text(
          _text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
