import 'package:asro/asroo_store_app.dart';
import 'package:asro/core/app/bloc_observer.dart';
import 'package:asro/core/app/env.variables.dart';
import 'package:asro/core/di/injection_container.dart';
import 'package:asro/core/service/sharedPrefereces/shared_pref.dart';
import 'package:asro/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();
await EnvVariables.instance.init(envTypes: EnvTypes.dev);
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
Bloc.observer = AppBlocObserver();
await SharedPref().instantiatePreferences();
await setupInjector();

await SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_)
  {
    runApp(const AsrooStoreApp());
  });

  
}



 