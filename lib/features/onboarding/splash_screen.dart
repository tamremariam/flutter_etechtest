import 'package:etechtest/core/uitils/image_constant.dart';
import 'package:etechtest/features/wigets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  void _navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      // context.go("/signin");
      context.go("/onboarding");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CustomImageView(
      imagePath: ImageConstant.logo,
      fit: BoxFit.fill,
    )));
  }
}
