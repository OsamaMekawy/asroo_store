import 'package:asro/core/app/app_cubit/app_cubit.dart';
import 'package:asro/core/app/connectivity_controller.dart';
import 'package:asro/core/common/screens/no_network_screen.dart';
import 'package:asro/core/di/injection_container.dart';
import 'package:asro/core/language/app_localization_setup.dart';
import 'package:asro/core/routes/app_routes.dart';
import 'package:asro/core/service/sharedPrefereces/pref_keys.dart';
import 'package:asro/core/service/sharedPrefereces/shared_pref.dart';
import 'package:asro/core/style/theme/app_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnrctivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => sl<AppCubit>()
              ..changeAppThemeMode(
                  sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
                  )..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    title: 'Asroo Store',
                    theme: cubit.isDark?themeLight() : themeDark(),
                    locale:  Locale(cubit.currentLangCode),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    debugShowCheckedModeBanner: false,
                    builder: (context, widget) {
                      return GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(
                            builder: (context) {
                              ConnrctivityController.instance.init();
                              return widget!;
                            },
                          ),
                        ),
                      );
                    },
                    home: Scaffold(
                      appBar: AppBar(
                        title: const Text('Asroo Store'),
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    initialRoute:  SharedPref()
                                .getString(PrefKeys.accessToken) !=
                            null
                        ? SharedPref().getString(PrefKeys.userRole) != 'admin'
                            ? AppRoutes.mainCustomer
                            : AppRoutes.homeAdmin
                        : AppRoutes.login,
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Network',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
