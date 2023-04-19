// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VideoModel {
  final String id;
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final int likes;
  final int comments;
  final String creatorUid;
  final String creator;
  final int createdAt;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.thumbnailUrl,
    required this.likes,
    required this.comments,
    required this.creatorUid,
    required this.creator,
    required this.createdAt,
  });

  VideoModel copyWith({
    String? id,
    String? title,
    String? description,
    String? fileUrl,
    String? thumbnailUrl,
    int? likes,
    int? comments,
    String? creatorUid,
    String? creator,
    int? createdAt,
  }) {
    return VideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      fileUrl: fileUrl ?? this.fileUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      creatorUid: creatorUid ?? this.creatorUid,
      creator: creator ?? this.creator,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'thumbnailUrl': thumbnailUrl,
      'likes': likes,
      'comments': comments,
      'creatorUid': creatorUid,
      'creator': creator,
      'createdAt': createdAt,
    };
  }

  factory VideoModel.fromMap({required Map<String, dynamic> map, String? videoId}) {
    return VideoModel(
      id: videoId ?? "",
      title: map['title'] as String,
      description: map['description'] as String,
      fileUrl: map['fileUrl'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      likes: map['likes'] as int,
      comments: map['comments'] as int,
      creatorUid: map['creatorUid'] as String,
      creator: map['creator'] as String,
      createdAt: map['createdAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson({required String source, String? videoId}) =>
      VideoModel.fromMap(map: json.decode(source) as Map<String, dynamic>, videoId: videoId);
}
