import 'package:flutter/material.dart';
import 'package:movie_app/services/auth_services.dart';
import 'package:movie_app/widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: SecondaryButton(
          icon: Image.asset(
            "assets/icons/google.png",
            width: 30,
          ),
          onTap: () async {
            await AuthServices.signInWithGoogle();
          },
          title: "Connect with Google",
        ),
      ),
    );
  }
}
