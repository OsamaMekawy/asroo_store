
import 'package:asro/core/common/screens/under_build_screen.dart';
import 'package:asro/core/routes/base_route.dart';
import 'package:asro/features/auth/presentation/refactors/login_body.dart';
import 'package:asro/features/auth/presentation/screens/login_screen.dart';

import 'package:flutter/material.dart';


class AppRoutes {
  static const String login = 'login';



  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen() );
       
      
      

       default:
         return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}