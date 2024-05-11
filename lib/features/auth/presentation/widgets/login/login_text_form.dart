import 'package:asro/core/common/animation/animation_do.dart';
import 'package:asro/core/common/widgets/custom_text_field.dart';
import 'package:asro/core/extensions/context_extension.dart';
import 'package:asro/core/language/lang_keys.dart';
import 'package:asro/core/utils/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
   bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
            hintText: context.translate(LangKeys.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value){
              if (!AppRegex.isEmailValid('')) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;

            },
            prefixIcon: Icon(Icons.email), 
            ) , 
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
            hintText: context.translate(LangKeys.password),
            keyboardType: TextInputType.visiblePassword,
            obscureText: isShowPassword,
            validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return null;
              },
               suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                  color: context.color.textColor,
                ),
              ), 
            ) , 
            )
        ],
      ),
    );
  }
}