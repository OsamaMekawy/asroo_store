import 'package:asro/core/app/app_cubit/app_cubit.dart';
import 'package:asro/core/common/animation/animation_do.dart';
import 'package:asro/core/common/widgets/custem_leanier_button.dart';
import 'package:asro/core/common/widgets/text_app.dart';
import 'package:asro/core/extensions/context_extension.dart';
import 'package:asro/core/language/app_localization.dart';
import 'package:asro/core/language/lang_keys.dart';
import 'package:asro/core/style/fonts/font_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInRight(
                duration: 400,
                child: CustomLinearButton(
                    onPressed:cubit.changeAppThemeMode,
                    child:  Icon(
                     cubit.isDark? Icons.light_mode_rounded :Icons.dark_mode_rounded,
                      color: Colors.white,
                    )));
          },
        ),
        
        // lang button
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
                if (AppLocalizations.of(context)!.isEnLocale) {
                cubit.toArabic();
              } else {
                cubit.toEnglish();
              }
            },
            height: 44.h,
            width: 100.w,
            child: TextApp(
              text: context.translate(LangKeys.language),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
