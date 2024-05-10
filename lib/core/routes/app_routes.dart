
import 'package:asro/core/common/screens/under_build_screen.dart';
import 'package:asro/core/routes/base_route.dart';
import 'package:asro/test_one.dart';
import 'package:asro/test_two.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String testOne = 'testOne';
  static const String testTwo = 'testTwo';


  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case testOne:
        return BaseRoute(page: TestOneScreen() );
       
      case testTwo:
        return BaseRoute(
          page: TestTwoScreen()
        );
      

       default:
         return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}