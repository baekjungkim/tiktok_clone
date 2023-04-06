import 'dart:convert';

class VideoModel {
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final int likes;
  final int comments;
  final String creatorUid;
  final int createdAt;

  VideoModel({
    this.title = "",
    this.description = "",
    this.fileUrl = "",
    this.thumbnailUrl = "",
    this.likes = 0,
    this.comments = 0,
    this.creatorUid = "",
    this.createdAt = 0,
  });

  VideoModel copyWith({
    String? title,
    String? description,
    String? fileUrl,
    String? thumbnailUrl,
    int? likes,
    int? comments,
    String? creatorUid,
    int? createdAt,
  }) {
    return VideoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      fileUrl: fileUrl ?? this.fileUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      creatorUid: creatorUid ?? this.creatorUid,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'thumbnailUrl': thumbnailUrl,
      'likes': likes,
      'comments': comments,
      'creatorUid': creatorUid,
      'createdAt': createdAt,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      fileUrl: map['fileUrl'] ?? '',
      thumbnailUrl: map['thumbnailUrl'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      comments: map['comments']?.toInt() ?? 0,
      creatorUid: map['creatorUid'] ?? '',
      createdAt: map['createdAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source));
}
