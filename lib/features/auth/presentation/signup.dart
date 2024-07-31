import 'package:flutter/material.dart';
import 'package:lets_talk/core/theme/colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Lets Talk"),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _nameController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _confirmPasswordController,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Sign Up"),
            ),
          )
        ],
      ),
    ));
  }
}
