import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/repos/user_repository.dart';
import 'package:tiktok_clone/utils.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _userRepository = ref.read(userRepository);
    _authenticationRepository = ref.read(authRepository);
    if (_authenticationRepository.isLoggedIn) {
      final profile = await _userRepository
          .findProfile(_authenticationRepository.user!.uid);
      if (profile != null) {
        return UserProfileModel.fromMap(profile);
      }
    }
    return UserProfileModel.empty();
  }

  Future<void> createProfile({
    required UserCredential credential,
    String email = "",
    String name = "",
    String birthday = "",
  }) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }

    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      uid: credential.user!.uid,
      email: credential.user!.email ?? email,
      name: credential.user!.displayName ?? name,
      bio: "undefined",
      link: "undefined",
      birthday: birthday,
      hasAvatar: false,
    );
    await _userRepository.createProfile(profile);
    state = AsyncValue.data(profile);
  }

  Future<void> onAvatarUpload() async {
    state = AsyncValue.data(
      state.value!.copyWith(hasAvatar: true),
    );
    await _userRepository.updateUsers(
      state.value!.uid,
      {"hasAvatar": true},
    );
  }

  Future<void> updateProfile(
    BuildContext context, {
    required String name,
    String link = "",
    String bio = "",
  }) async {
    state = const AsyncValue.loading();
    final profile = state.value!.copyWith(
      name: name,
      link: link,
      bio: bio,
    );
    state = await AsyncValue.guard(() async {
      await _userRepository.updateUsers(state.value!.uid, {
        "name": name,
        "link": link,
        "bio": bio,
      });
      return profile;
    });
    if (state.hasError) {
      if (context.mounted) {
        showFirebaseErrorSnack(context, state.error);
      }
    } else {
      if (context.mounted) {
        context.pop();
      }
    }
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
