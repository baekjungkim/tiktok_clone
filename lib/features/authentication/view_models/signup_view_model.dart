import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepository);
  }

  Future<void> signUp() async {
    state = const AsyncValue.loading();
    final form = ref.read(signupForm);
    state = await AsyncValue.guard(
      () async => await _authRepository.signUp(
        email: form['email'],
        password: form['password'],
      ),
    );
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);

final signupForm = StateProvider((ref) => {});
