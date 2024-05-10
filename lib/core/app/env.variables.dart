import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypes {dev ,prod}

class EnvVariables{
  EnvVariables._();


  static final EnvVariables instance = EnvVariables._();

  String _envType  = '';


  Future <void> init({required EnvTypes envTypes}) async{

    switch (envTypes) {
      case EnvTypes.dev:
       await  dotenv.load(fileName: '.env.dev');
        break;
      case EnvTypes.prod:
       await  dotenv.load(fileName: '.env.production');
    }

    _envType = dotenv.get('ENV_TYPE');

  }
  String get envType => _envType;
}