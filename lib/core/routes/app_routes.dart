
import 'package:asro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:asro/core/common/screens/under_build_screen.dart';
import 'package:asro/core/di/injection_container.dart';
import 'package:asro/core/routes/base_route.dart';
import 'package:asro/features/admin/home_admin.dart';
import 'package:asro/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:asro/features/auth/presentation/refactors/login_body.dart';
import 'package:asro/features/auth/presentation/refactors/signup_body.dart';
import 'package:asro/features/auth/presentation/screens/login_screen.dart';
import 'package:asro/features/auth/presentation/screens/sign_up.dart';
import 'package:asro/features/customer/home_customer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static const String homeAdmin = 'homeAdmin';
  static const String mainCustomer = 'main-screen';
  static const String webview = 'webView';
  static const String productDetails = 'product-details';
  static const String category = 'catgeory';
  static const String productsViewAll = 'productsViewAll';
  static const String search = 'search';




  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: BlocProvider(
          create: (context)=>sl<AuthBloc>(),
          child: const LoginScreen()
          ));
        
        case signup:
        return BaseRoute(page: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>sl<UploadImageCubit>()),
            BlocProvider(create: (context)=>sl<AuthBloc>())
          ],
          child: const SignUp()
          )
           );
        case homeAdmin:
        return BaseRoute(page: const HomeAdmin() );
        case mainCustomer:
        return BaseRoute(page: const HomeCustomer() );
       
      
      

       default:
         return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}