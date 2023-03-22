import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/settings/models/mode_config_model.dart';
import 'package:tiktok_clone/features/settings/repositories/mode_config_repository.dart';

class ModeConfigViewModel extends Notifier<ModeConfigModel> {
  final ModeConfigRepository _repository;

  ModeConfigViewModel(this._repository);

  void setMode(bool value) {
    _repository.setMode(value);
    state = ModeConfigModel(isDark: value);
  }

  @override
  ModeConfigModel build() {
    return ModeConfigModel(
      isDark: _repository.isDark(),
    );
  }
}

final modeConfigProvider =
    NotifierProvider<ModeConfigViewModel, ModeConfigModel>(
  () => throw UnimplementedError(),
);
