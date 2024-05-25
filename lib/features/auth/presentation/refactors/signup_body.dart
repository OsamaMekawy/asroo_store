import 'package:asro/core/common/animation/animation_do.dart';
import 'package:asro/core/common/widgets/text_app.dart';
import 'package:asro/core/extensions/context_extension.dart';
import 'package:asro/core/language/lang_keys.dart';
import 'package:asro/core/routes/app_routes.dart';
import 'package:asro/core/style/fonts/font_widget_helper.dart';
import 'package:asro/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:asro/features/auth/presentation/widgets/dark_lang_buttons.dart';
import 'package:asro/features/auth/presentation/widgets/login/login_text_form.dart';
import 'package:asro/features/auth/presentation/widgets/sign_up/signup_button.dart';
import 'package:asro/features/auth/presentation/widgets/sign_up/signup_text_form.dart';
import 'package:asro/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/login/login_button.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Dark mode and language
            const DarkAndLangButtons(),

            SizedBox(height: 50.h),

            // Welcome Info
            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              description: context.translate(LangKeys.welcome),
            ),
            SizedBox(height: 10.h),
           const UserAvararImage(),

            SizedBox(height: 30.h),

            // signup TextForm
            const SignUpTextForm(),

            SizedBox(height: 30.h),
            //SignUpButton
            const SignUpButton(),

            SizedBox(height: 30.h),

            // Go To Sign Up Screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.signup);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}