import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/videos/repositories/videos_repository.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(videosRepository);
  }

  Future<void> uploadVideo({
    required File video,
    required String title,
    String description = "",
  }) async {
    final user = ref.read(authRepository).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadVideoFile(user!.uid, video);
      if (task.metadata != null) {
        // await _repository.saveVideo();
      }
      // await ref.read(timelineProvider.notifier).addTimeline(newVideo),
    });
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
