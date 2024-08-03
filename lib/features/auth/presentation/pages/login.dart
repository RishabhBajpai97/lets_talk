import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/core/theme/colors.dart';
import 'package:lets_talk/features/auth/presentation/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'package:lets_talk/features/auth/presentation/widgets/custom_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          Navigator.of(context).pushReplacementNamed("/home");
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                ),
              ),
            );
        }
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
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
              CustomField(
                hintText: "Password",
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthLogin(
                            password: passwordController.text,
                            username: nameController.text,
                          ),
                        );
                  }
                },
                style: const ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(150, 50))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                        text: 'Login',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/signup");
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
