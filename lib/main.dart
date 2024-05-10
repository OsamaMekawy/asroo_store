import 'package:asro/asroo_store_app.dart';
import 'package:asro/core/app/env.variables.dart';
import 'package:asro/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();
await EnvVariables.instance.init(envTypes: EnvTypes.dev);
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

await SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_)
  {
    runApp(const AsrooStoreApp());
  });

  
}



 