import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // create
  Future<void> createProfile(UserProfileModel user) async {}

  // get
  // update
  // avatar
  // bio
}

final userRepository = Provider(
  (ref) => UserRepository(),
);
