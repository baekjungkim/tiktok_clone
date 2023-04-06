import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';
import 'package:tiktok_clone/features/videos/repositories/videos_repository.dart';
import 'package:tiktok_clone/features/videos/view_models/timeline_view_model.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(videosRepository);
  }

  Future<void> uploadVideo(
    BuildContext context, {
    required File video,
    required String title,
    String description = "",
  }) async {
    final user = ref.read(authRepository).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final task = await _repository.uploadVideoFile(user!.uid, video);
        if (task.metadata != null) {
          final videoModel = VideoModel(
            title: title,
            description: description,
            fileUrl: await task.ref.getDownloadURL(),
            thumbnailUrl: "",
            likes: 0,
            comments: 0,
            creatorUid: user.uid,
            creator: userProfile.name,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          );
          await _repository.saveVideo(videoModel);
          await ref.read(timelineProvider.notifier).addTimeline(videoModel);
          if (context.mounted) {
            context.pushReplacement("/home");
          }
        }
      },
    );
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
