import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/core/uitils/timer_utils.dart';
import 'package:etechtest/features/authentication/presentation/widgets/otp.dart';
import 'package:etechtest/features/wigets/custom_elevated_button.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final List<TextEditingController> _otpControllers =
      List.generate(5, (_) => TextEditingController());
  final TimerUtil timerUtil = TimerUtil();
  String timerText = "03:15";
  bool isTimerRunning = false;

  void onOTPChanged(String value) {}

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void startTimer() {
    timerUtil.startCountdown(3 * 60 + 15, (time) {
      setState(() {
        timerText = time;
      });
    }, onTimerComplete: onTimerComplete);
  }

  void onTimerComplete() {
    setState(() {
      isTimerRunning = false;
    });
  }

  @override
  void dispose() {
    timerUtil.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 107.h,
            ),
            CustomText(
              AppLocalizations.of(context)!.checkYourEmail,
              size: TextSize.headlineMedium,
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: CustomText(
                AppLocalizations.of(context)!.weveSentTheCode,
                size: TextSize.bodyMedium,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            OTPInput(
              controllers: _otpControllers,
              onChanged: onOTPChanged,
            ),
            SizedBox(height: 72.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  AppLocalizations.of(context)!.codeExpiresIn,
                  size: TextSize.bodyMedium,
                ),
                CustomText(
                  timerText,
                  size: TextSize.bodyMedium,
                  color: AppThemes.secondaryColor,
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.verify,
              onPressed: () {
                context.push("/resetpassword");
              },
              borderRadius: 40,
              width: 320.w,
              height: 50.h,
            ),
            SizedBox(height: 24.h),
            CustomElevatedButton(
              color: Colors.transparent,
              fontcolor: AppThemes.mainTextColor,
              borderColor: AppThemes.outlineColor,
              borderWidth: 4,
              text: AppLocalizations.of(context)!.sendAgain,
              onPressed: () => startTimer(),
              borderRadius: 40,
              width: 320.w,
              height: 50.h,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
