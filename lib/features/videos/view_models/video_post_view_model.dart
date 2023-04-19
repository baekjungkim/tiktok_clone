import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/videos/repositories/videos_repository.dart';

class VideoPostViewModel extends FamilyAsyncNotifier<void, String> {
  late final VideosRepository _repository;
  late final _videoId;

  @override
  FutureOr<void> build(String videoId) {
    _videoId = videoId;
    _repository = ref.read(videosRepository);
  }

  Future<void> toggleVideoLike() async {
    final user = ref.read(authRepository).user;
    await _repository.toggleVideoLike(_videoId, user!.uid);
  }
}

final videoPostProvider =
    AsyncNotifierProvider.family<VideoPostViewModel, void, String>(
  () => VideoPostViewModel(),
);
