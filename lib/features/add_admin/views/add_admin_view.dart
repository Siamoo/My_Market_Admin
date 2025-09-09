import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/components/custom_elevated_button.dart';
import 'package:my_market_admin/core/components/custom_text_form_field.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';
import 'package:my_market_admin/core/functions/navigation_service.dart';
import 'package:my_market_admin/features/add_admin/cubit/cubit/add_admin_cubit.dart';
import 'package:my_market_admin/features/auth/views/login_view.dart';

class AddAdminView extends StatefulWidget {
  const AddAdminView({super.key});

  @override
  State<AddAdminView> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Add Admin'),
      body: BlocProvider(
        create: (context) => AddAdminCubit(),
        child: BlocConsumer<AddAdminCubit, AddAdminState>(
          listener: (context, state) {
            if (state is CreateAdminSuccess) {
              NavigationService.navigateWithoutBack(context, LoginView());
            }
            if (state is CreateAdminError) {
            
            }
          },
          builder: (context, state) {
            AddAdminCubit cubit = context.read<AddAdminCubit>();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: state is CreateAdminLoading ? const Center(child: CircularProgressIndicator()) : Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: passwordController,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(
                      width: 100,
                      height: 40,
                      child: const Text('Add'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.creartAnAccount(
                            {
                              'email': emailController.text,
                              'password': passwordController.text,
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
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
