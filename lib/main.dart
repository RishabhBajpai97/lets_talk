import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/core/theme/theme.dart';
import 'package:lets_talk/features/auth/presentation/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'package:lets_talk/features/auth/presentation/pages/login.dart';
import 'package:lets_talk/features/auth/presentation/pages/signup.dart';
import 'package:lets_talk/features/home/presentation/pages/home.dart';
import 'package:lets_talk/init_dependencies.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const SignupPage(),
        routes: {
          "/login": (context) => const LoginPage(),
          "/signup": (context) => const SignupPage(),
          "/home": (context) => const HomePage()
        },
      ),
    );
  }
}
