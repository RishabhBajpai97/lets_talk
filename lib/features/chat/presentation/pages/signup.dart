import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/core/theme/colors.dart';
import 'package:lets_talk/features/auth/presentation/widgets/custom_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Lets Talk",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomField(hintText: "Name", controller: nameController),
          const SizedBox(
            height: 20,
          ),
          CustomField(hintText: "Email", controller: emailController),
          const SizedBox(
            height: 20,
          ),
          CustomField(
            hintText: "Password",
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomField(
            hintText: "Confirm Password",
            controller: confirmPasswordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(150, 50))),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                    text: 'Sign In',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, "/login");
                      }),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
