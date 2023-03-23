import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/firebase_errors.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  final message =
      firebaseErrors[(error as FirebaseException).code] ?? "Server Error";
  final snack = SnackBar(
    showCloseIcon: true,
    content: Text(message),
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
