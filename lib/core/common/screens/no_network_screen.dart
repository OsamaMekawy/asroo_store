import 'package:asro/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.noNetwork),
            fit: BoxFit.fill
           
          ),
        ),
        ),
      ),
    );
  }
}