import 'package:asro/core/common/animation/animation_do.dart';
import 'package:flutter/material.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
       duration: 500,
       child: CircleAvatar(
        radius: 38,
        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1714745454857-5adce201be50?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),

       ),
       );
  }
}