import 'package:flutter/material.dart';

class ModeConfig extends ChangeNotifier {
  String mode = 'light';

  void toggleMode() {
    mode = mode == 'light' ? 'dark' : 'light';
    notifyListeners();
  }
}
