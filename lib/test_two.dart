import 'package:flutter/material.dart';

class TestTwoScreen extends StatelessWidget {
  const TestTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("One") ,
      ),
      body: Center(
        child: Text(
         
          "One",
        ),
      ),
    );
  }
}