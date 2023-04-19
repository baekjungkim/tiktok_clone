import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';
import 'package:tiktok_clone/features/videos/repositories/videos_repository.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _repository;
  List<VideoModel> _list = [];

  Future<List<VideoModel>> _fetchVideos({int? lastItemCreatedAt}) async {
    final result = await _repository.fetchVideos(
      lastItemCreatedAt: lastItemCreatedAt,
    );
    final newVideoList = result.docs.map(
      (doc) => VideoModel.fromMap(
        map: doc.data(),
        videoId: doc.id,
      ),
    );
    return newVideoList.toList();
  }

  Future<void> addTimeline(VideoModel newVideo) async {
    _list.add(newVideo);
    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videosRepository);
    _list = await _fetchVideos(lastItemCreatedAt: null);
    return _list;
  }

  Future<void> fetchNextPage() async {
    final nextList =
        await _fetchVideos(lastItemCreatedAt: _list.last.createdAt);
    state = AsyncValue.data([..._list, ...nextList]);
  }

  Future<void> refresh() async {
    final videos = await _fetchVideos(lastItemCreatedAt: null);
    _list = videos;
    state = AsyncValue.data(videos);
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
