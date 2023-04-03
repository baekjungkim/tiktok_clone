import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepository);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signupForm);
    final users = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(
      () async {
        final userCredential = await _authRepository.signUp(
          email: form['email'],
          password: form['password'],
        );
        await users.createProfile(
          credential: userCredential,
          email: form['email'],
          name: form['name'],
          birthday: form['birthday'],
        );
      },
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(InterestsScreen.routerName);
    }
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);

final signupForm = StateProvider((ref) => {});
