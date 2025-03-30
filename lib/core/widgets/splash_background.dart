import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/images.dart';

class SplashBackGround extends StatelessWidget {
  const SplashBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(AppImages.bg, width: double.infinity, height:double.infinity, fit: BoxFit.cover);

  }
}
