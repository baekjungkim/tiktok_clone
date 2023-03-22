import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';
import 'package:tiktok_clone/features/videos/view_models/timeline_view_model.dart';

class UploadVideoViewModel extends AsyncNotifier<VideoModel> {
  Future<void> uploadVideo() async {
    state = const AsyncValue.loading();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final newVideo = VideoModel(title: "${DateTime.now()}");
    ref.read(timelineProvider.notifier).addVideo(newVideo);
    state = AsyncValue.data(newVideo);
  }

  @override
  FutureOr<VideoModel> build() {
    return VideoModel(title: "${DateTime.now()}");
  }
}

final uploadVideoProvider =
    AsyncNotifierProvider<UploadVideoViewModel, VideoModel>(
  () => UploadVideoViewModel(),
);
