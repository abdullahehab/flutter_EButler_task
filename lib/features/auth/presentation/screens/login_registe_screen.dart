import 'package:flutter/material.dart';
import 'package:flutter_ebutler_task/core/extensions/extension.dart';
import 'package:flutter_ebutler_task/core/utils/app_colors.dart';
import 'package:flutter_ebutler_task/core/utils/text_field_validator.dart';
import 'package:flutter_ebutler_task/features/auth/domain/usecaese/login_usecase.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';

class LoginRegisterScreen extends StatelessWidget {
  LoginRegisterScreen({Key? key}) : super(key: key);

  final loginFormKey = GlobalKey<FormState>();

  validateAndLogin() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      print('start login');
    }
  }

  LoginParameters loginParameters =
      const LoginParameters(email: '', password: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              BuildEmailButton(
                onEmailChanged: (email) {},
              ),
              SizedBox(height: 10.h),
              BuildPasswordButton(
                onPasswordChanged: (password) {},
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () => validateAndLogin(),
                child: const Text('Login'),
              ).setWidth(context.width)
            ],
          ),
        ),
      ).setCenter().addPaddingHorizontalVertical(horizontal: 20),
    );
  }
}

class BuildEmailButton extends StatelessWidget {
  const BuildEmailButton({Key? key, required this.onEmailChanged})
      : super(key: key);

  final ValueChanged<String>? onEmailChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: TextFieldValidators.isEmail,
      onChangedText: onEmailChanged,
      prefixIcon: const Icon(Icons.email),
      hintText: 'email',
      textInputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

class BuildPasswordButton extends StatelessWidget {
  const BuildPasswordButton({Key? key, required this.onPasswordChanged})
      : super(key: key);

  final ValueChanged<String>? onPasswordChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: TextFieldValidators.isEmail,
      onChangedText: onPasswordChanged,
      prefixIcon: const Icon(Icons.key),
      hintText: 'password',
      textInputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
