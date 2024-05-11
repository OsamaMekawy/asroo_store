import 'package:asro/core/common/animation/animation_do.dart';
import 'package:asro/core/common/widgets/custem_leanier_button.dart';
import 'package:asro/core/common/widgets/text_app.dart';
import 'package:asro/core/extensions/context_extension.dart';
import 'package:asro/core/language/app_localization.dart';
import 'package:asro/core/language/lang_keys.dart';
import 'package:asro/core/style/fonts/font_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
          onPressed: (){},
         child: const Icon(Icons.light_mode_rounded,color: Colors.white,)
         )
         ),
          CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
            
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