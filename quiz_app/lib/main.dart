import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/theme/app_theme.dart';
import 'package:quiz_app/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode
          .system, // Automatically use dark theme based on system settings
      home: const SplashView(),
    );
  }
}
