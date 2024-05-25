import 'package:asro/core/common/animation/animation_do.dart';
import 'package:asro/core/common/widgets/custom_text_field.dart';
import 'package:asro/core/extensions/context_extension.dart';
import 'package:asro/core/language/lang_keys.dart';
import 'package:asro/core/utils/app_regex.dart';
import 'package:asro/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isShowPassword = true;
  
   

  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _bloc.nameController.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.nameController,
            hintText: context.translate(LangKeys.fullName),
            keyboardType: TextInputType.emailAddress,
            validator: (value){
              if (value == null || value.length<4 || value.isEmpty) {
                  return context.translate(LangKeys.validName);
                }
                return null;

            },
            prefixIcon:const Icon(Icons.person), 
            ) , 
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.emailController,
            hintText: context.translate(LangKeys.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value){
              if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;

            },
            prefixIcon:const Icon(Icons.email), 
            ) , 
            ),
             SizedBox(
              height: 25.h,
            ),
            CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.passwordController,
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