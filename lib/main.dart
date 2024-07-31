import 'package:flutter/material.dart';
import 'package:lets_talk/core/theme/theme.dart';
import 'package:lets_talk/features/auth/presentation/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SignupPage(),
    );
  }
}
