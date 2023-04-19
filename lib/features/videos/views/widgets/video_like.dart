import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/videos/view_models/video_like_view_model.dart';
import 'package:tiktok_clone/features/videos/views/widgets/video_action_button.dart';

class VideoLike extends ConsumerStatefulWidget {
  const VideoLike({
    super.key,
    required this.videoId,
    required this.likes,
  });

  final String videoId;
  final int likes;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoLikeState();
}

class _VideoLikeState extends ConsumerState<VideoLike> {
  int _like = 0;
  @override
  void initState() {
    super.initState();
    _like = widget.likes;
  }

  void _onListTap(bool isLiked) {
    ref.read(videoLikeProvider(widget.videoId).notifier).toggleVideoLike();
    if (isLiked) {
      _like--;
    } else {
      _like++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(videoLikeProvider(widget.videoId)).when(
          error: (error, stackTrace) => VideoActionButton(
            icon: FontAwesomeIcons.solidHeart,
            text: '$_like',
          ),
          loading: () => VideoActionButton(
            icon: FontAwesomeIcons.solidHeart,
            text: '$_like',
          ),
          data: (isLiked) {
            return GestureDetector(
              onTap: () => _onListTap(isLiked),
              child: VideoActionButton(
                icon: FontAwesomeIcons.solidHeart,
                text: '$_like',
                iconColor: isLiked ? Colors.red : Colors.white,
              ),
            );
          },
        );
  }
}
