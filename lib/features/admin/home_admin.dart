import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Admin",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}