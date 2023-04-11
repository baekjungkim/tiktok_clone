import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';
import 'package:tiktok_clone/features/videos/repositories/videos_repository.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _repository;
  List<VideoModel> _list = [];

  Future<void> addTimeline(VideoModel newVideo) async {
    _list.add(newVideo);
    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videosRepository);
    final result = await _repository.fetchVideos();
    final newVideoList = result.docs.map(
      (doc) => VideoModel.fromMap(
        doc.data(),
      ),
    );
    _list = newVideoList.toList();
    return _list;
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
