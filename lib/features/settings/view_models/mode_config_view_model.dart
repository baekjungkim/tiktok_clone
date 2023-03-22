import 'package:flutter/foundation.dart';
import 'package:tiktok_clone/features/settings/models/mode_config_model.dart';
import 'package:tiktok_clone/features/settings/repositories/mode_config_repository.dart';

class ModeConfigViewModel extends ChangeNotifier {
  final ModeConfigRepository _repository;

  late final ModeConfigModel _model = ModeConfigModel(
    isDark: _repository.isDark(),
  );

  ModeConfigViewModel(this._repository);

  bool get isDark => _model.isDark;

  void setMode(bool value) {
    _repository.setMode(value);
    _model.isDark = value;
    notifyListeners();
  }
}
