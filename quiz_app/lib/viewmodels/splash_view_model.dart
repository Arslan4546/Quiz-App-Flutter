import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/viewmodels/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  final int splashDuration = 3; // Duration in seconds

  Future<void> initSplash(BuildContext context) async {
    setLoading(true);

    // Simulate loading resources or checking authentication
    await Future.delayed(Duration(seconds: splashDuration));

    setLoading(false);
  }
}
