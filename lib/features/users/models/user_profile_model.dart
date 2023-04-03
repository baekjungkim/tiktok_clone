import 'dart:convert';

class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String bio;
  final String link;
  final String birthday;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.bio,
    required this.link,
    required this.birthday,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        bio = "",
        link = "",
        birthday = "";

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bio': bio,
      'link': link,
      'birthday': birthday,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      bio: map['bio'] ?? '',
      link: map['link'] ?? '',
      birthday: map['birthday'] ?? '',
    );
  }

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source));
}
