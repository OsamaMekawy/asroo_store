import 'package:asro/core/common/animation/animation_do.dart';
import 'package:asro/core/common/widgets/custem_leanier_button.dart';
import 'package:asro/core/common/widgets/text_app.dart';
import 'package:asro/core/extensions/context_extension.dart';
import 'package:asro/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        onPressed: () {},
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        child:  TextApp(text: context.translate(LangKeys.signUp), theme: context.textStyle.copyWith(fontSize: 18.sp,fontWeight: FontWeight.bold),
          
        ),
        
               
              ),
              // CustomLinearButton(
              //   onPressed: () {
              //     _validateThenDoLogin(context);
              //   },
              //   height: 50.h,
              //   width: MediaQuery.of(context).size.width,
              //   child: TextApp(
              //     text: context.translate(LangKeys.login),
              //     theme: context.textStyle.copyWith(
              //       fontSize: 18.sp,
              //       fontWeight: FontWeightHelper.bold,
              //     ),
              //   ),
              // );
       
        
           
           
               
            
            
               
            
        
           
    );;
  }
}