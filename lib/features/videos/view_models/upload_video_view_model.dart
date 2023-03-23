import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';
import 'package:tiktok_clone/features/videos/view_models/timeline_view_model.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  Future<void> uploadVideo() async {
    state = const AsyncValue.loading();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final newVideo = VideoModel(title: "${DateTime.now()}");
    state = await AsyncValue.guard(
      () async =>
          await ref.read(timelineProvider.notifier).addTimeline(newVideo),
    );
  }

  @override
  FutureOr<void> build() {}
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
