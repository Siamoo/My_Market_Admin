import 'package:flutter/material.dart';
import 'package:my_market_admin/core/components/custom_text_form_field.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Login As An Admin'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          SizedBox(height: 10),
          CustomTextFormField(controller: emailController, labelText: 'email'),
          SizedBox(height: 20),
          CustomTextFormField(
            controller: passwordController,
            labelText: 'password',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
