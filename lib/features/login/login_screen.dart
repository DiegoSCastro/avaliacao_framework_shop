import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/widgets/custom_button.dart';
import 'package:avaliacao_framework_shop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Observer(builder: (_) {
                return CustomTextField(
                  errorText: controller.emailError,
                  onChanged: controller.setEmail,
                  initialValue: controller.email,
                  label: 'Email',
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return CustomTextField(
                  errorText: controller.passwordError,
                  onChanged: controller.setPassword,
                  initialValue: controller.password,
                  label: 'Password',
                );
              }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(builder: (_) {
                    return CustomButton(
                        loading: controller.loading,
                        labelText: 'Login',
                        onTap: () {
                          controller.login(context);
                        });
                  }),
                  CustomButton(
                    labelText: 'Criar',
                    color: AppColors.pink,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
