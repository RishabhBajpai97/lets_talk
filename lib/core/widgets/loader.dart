import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lets_talk/core/theme/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}
