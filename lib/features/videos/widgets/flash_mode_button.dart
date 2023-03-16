import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

const _flashModeMap = {
  FlashMode.always: {
    "icon": Icon(
      Icons.flash_on_rounded,
    ),
    "nextMode": FlashMode.torch,
  },
  FlashMode.torch: {
    "icon": Icon(
      Icons.flashlight_on_rounded,
    ),
    "nextMode": FlashMode.auto,
  },
  FlashMode.auto: {
    "icon": Icon(
      Icons.flash_auto_rounded,
    ),
    "nextMode": FlashMode.off,
  },
  FlashMode.off: {
    "icon": Icon(
      Icons.flash_off_rounded,
    ),
    "nextMode": FlashMode.always,
  },
};

class FlashModeButton extends StatelessWidget {
  const FlashModeButton({
    super.key,
    required flashMode,
    required onPressed,
  })  : _flashMode = flashMode,
        _onPressed = onPressed;

  final FlashMode _flashMode;
  final Function _onPressed;

  @override
  Widget build(BuildContext context) {
    Icon flashIcon = _flashModeMap[_flashMode]!['icon'] as Icon;
    FlashMode nextFlashMode =
        _flashModeMap[_flashMode]!['nextMode'] as FlashMode;
    return IconButton(
      color:
          !_flashModeMap.containsKey(_flashMode) || _flashMode == FlashMode.off
              ? Colors.white
              : Colors.amber.shade200,
      onPressed: () => _onPressed(nextFlashMode),
      icon: flashIcon,
    );
  }
}
