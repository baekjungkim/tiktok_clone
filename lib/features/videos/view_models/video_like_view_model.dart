import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/videos/repositories/videos_repository.dart';

class VideoLikeViewModel extends FamilyAsyncNotifier<bool, String> {
  late final VideosRepository _repository;
  late final String _videoId;
  bool _isLiked = false;

  @override
  FutureOr<bool> build(String arg) async {
    _videoId = arg;
    _repository = ref.read(videosRepository);
    final user = ref.read(authRepository).user!;
    _isLiked = await _repository.isVideoLike(_videoId, user.uid);
    return _isLiked;
  }

  Future<void> toggleVideoLike() async {
    final user = ref.read(authRepository).user;
    await _repository.toggleVideoLike(_videoId, user!.uid);
    _isLiked = !_isLiked;
    state = AsyncValue.data(_isLiked);
  }
}

final videoLikeProvider =
    AsyncNotifierProvider.family<VideoLikeViewModel, bool, String>(
  () => VideoLikeViewModel(),
);
