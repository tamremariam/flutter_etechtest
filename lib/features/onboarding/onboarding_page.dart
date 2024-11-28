import 'package:etechtest/core/uitils/image_constant.dart';
import 'package:etechtest/features/wigets/custom_elevated_button.dart';
import 'package:etechtest/features/wigets/custom_image_view.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 12.h,
          ),
          CustomImageView(
            imagePath: ImageConstant.onboarding,
            width: double.infinity,
            height: 406.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 48.h,
          ),
          CustomText(
            AppLocalizations.of(context)!.startCooking,
            size: TextSize.headlineLarge,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomText(
            AppLocalizations.of(context)!.joinCommunitycookBetterFood,
            size: TextSize.bodyLarge,
          ),
          SizedBox(
            height: 72.h,
          ),
          CustomElevatedButton(
            text: AppLocalizations.of(context)!.getStarted,
            onPressed: () {
              context.push("/login");
            },
            borderRadius: 40,
            width: 320.w,
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
