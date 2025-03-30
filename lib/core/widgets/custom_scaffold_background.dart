import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/images.dart';

class CustomScaffoldBackground extends StatelessWidget {
  const CustomScaffoldBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(AppImages.backGround, width: double.infinity, height:double.infinity, fit: BoxFit.cover);

  }
}