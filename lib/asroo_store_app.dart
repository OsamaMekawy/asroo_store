import 'package:asro/core/app/connectivity_controller.dart';
import 'package:asro/core/common/screens/no_network_screen.dart';
import 'package:asro/core/language/app_localization_setup.dart';
import 'package:asro/core/routes/app_routes.dart';
import 'package:asro/core/style/theme/app_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ValueListenableBuilder(
      valueListenable: ConnrctivityController.instance.isConnected,
      builder:(_ ,value,__){
        if(value){
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: MaterialApp(
                    title: 'Asroo Store',
                    theme: themeDark(),
                     locale: const Locale('en'),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    
                    debugShowCheckedModeBanner:false,
                    builder: (context,widget){
                      return GestureDetector(
                        onTap: (){
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(
                                      builder: (context){
                                        ConnrctivityController.instance.init();
                                        return widget!;
                                      
                         },
                          ),
                          
                        ),
                      );
                    },
                    home:  Scaffold(
                      appBar: AppBar(
                        title: const Text('Asroo Store'),
                        
                        backgroundColor: Colors.deepPurple,
                      )  ,
                      
                    ),
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    initialRoute: AppRoutes.testOne,
                  ),
            );
        }else{
            return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const  NoNetworkScreen(),
    );
        }

      } ,
    );
 
  }
}