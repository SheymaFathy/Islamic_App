import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/core/constants/images.dart';
import 'package:islamic_app/core/routes/routes.dart';
import 'package:islamic_app/core/widgets/splash_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Stack(
          children: [
            SplashBackGround(),
            Positioned(
                bottom: 10,
                right: 5,
                child: ContinueBtn()
            ),

          ],
        ),
      ),
    );
  }
}

class ContinueBtn extends StatelessWidget {
  const ContinueBtn({super.key});




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                GoRouter.of(context).go(AppRouter.kMainScreen);
              },
             child: Image.asset(AppImages.go, fit: BoxFit.cover, width: 100, height: 100),

            ),

          ],
        ),
      ),
    );
  }
}
