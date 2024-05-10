import 'package:asro/core/app/connectivity_controller.dart';
import 'package:asro/core/common/screens/no_network_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ValueListenableBuilder(
      valueListenable: ConnrctivityController.instance.isConnected,
      builder:(_ ,value,__){
        if(value){
            return MaterialApp(
      title: 'Asroo Store',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context,widget){
        return Scaffold(
          body: Builder(
            builder: (context){
              ConnrctivityController.instance.init();
              return widget!;

            },
          ),
        );
      },
      home:  Scaffold(
        appBar: AppBar(
          title: const Text('Asroo Store'),
          backgroundColor: Colors.deepPurple,
        )  ,
      ),
    );
        }else{
            return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const  NoNetworkScreen(),
    );
        }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      } ,
    );
 
  }
}