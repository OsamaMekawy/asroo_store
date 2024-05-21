import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeCustomer extends StatelessWidget {
  const HomeCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Customer",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}