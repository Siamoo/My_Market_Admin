import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/components/custom_elevated_button.dart';
import 'package:my_market_admin/core/components/custom_text_form_field.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';
import 'package:my_market_admin/core/functions/navigation_service.dart';
import 'package:my_market_admin/features/auth/cubit/cubit/login_cubit.dart';
import 'package:my_market_admin/features/home/views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            NavigationService.pushReplacementTo(context, HomeView());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(context, 'Login As An Admin'),
            body: state is LoginLoading
                ? const Center(child: CircularProgressIndicator())
                : Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _emailController,
                          labelText: 'email',
                        ),
                        SizedBox(height: 20),
                        CustomTextFormField(
                          controller: _passwordController,
                          labelText: 'password',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomElevatedButton(
                          width: 100,
                          height: 40,
                          child: const Text('Login'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login({
                                'email': _emailController.text,
                                'password': _passwordController.text,
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
