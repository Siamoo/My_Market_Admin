import 'package:flutter/material.dart';
import 'package:my_market_admin/core/components/custom_elevated_button.dart';
import 'package:my_market_admin/core/components/custom_text_form_field.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(labelText: 'Email', controller: emailController),
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
                onPressed: () {},
              ),
            ],
          ),
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
