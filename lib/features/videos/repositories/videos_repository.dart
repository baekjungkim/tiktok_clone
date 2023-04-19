import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

class VideosRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // upload a video file
  UploadTask uploadVideoFile(String uid, File video) {
    final fileRef = _storage.ref().child(
          "/videos/$uid/${DateTime.now().millisecondsSinceEpoch}",
        );
    return fileRef.putFile(video);
  }

  // create a video document
  Future<void> saveVideo(VideoModel data) async {
    await _db.collection('videos').add(data.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchVideos({
    int? lastItemCreatedAt,
  }) {
    final query = _db
        .collection('videos')
        .orderBy('createdAt', descending: true)
        .limit(2);

    if (lastItemCreatedAt == null) {
      return query.get();
    }
    return query.startAfter([lastItemCreatedAt]).get();
  }

  Future<bool> isVideoLike(String videoId, String userId) async {
    final like =
        await _db.collection("likes").doc("${videoId}000$userId").get();
    return like.exists;
  }

  Future<void> toggleVideoLike(String videoId, String userId) async {
    final query = _db.collection("likes").doc("${videoId}000$userId");
    final like = await query.get();

    if (!like.exists) {
      await query.set({
        "createdAt": DateTime.now().millisecondsSinceEpoch,
      });
    } else {
      await query.delete();
    }
  }
}

final videosRepository = Provider(
  (ref) => VideosRepository(),
);
