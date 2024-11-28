import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/core/uitils/validation_functions.dart';
import 'package:etechtest/features/wigets/custom_elevated_button.dart';
import 'package:etechtest/features/wigets/custom_text_field.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    //i declar here because i use stateless widget it doesnot reload i cant looase my datas
    final ValueNotifier<bool> passwordVisibility = ValueNotifier<bool>(false);
    final ValueNotifier<bool> ispasswordAllist6caratters =
        ValueNotifier<bool>(false);
    final ValueNotifier<bool> ispasswordContainaNumber =
        ValueNotifier<bool>(false);
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 123.h,
                ),
                CustomText(
                  AppLocalizations.of(context)!.resetPassword,
                  size: TextSize.headlineMedium,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: CustomText(
                    AppLocalizations.of(context)!.pleaseEnterNewPassword,
                    size: TextSize.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: passwordVisibility,
                  builder: (context, isPasswordVisible, child) {
                    return CustomTextField(
                      prefixIcon: Icons.lock_outline_rounded,
                      backgroundcolor: Colors.transparent,
                      width: 384.74.h,
                      height: 60.h,
                      borderRadius: 40,
                      borderColor: AppThemes.outlineColor,
                      borderWidth: 2,
                      contentPadding: EdgeInsets.only(left: 28.w, top: 50),
                      controller: passwordController,
                      hintText: AppLocalizations.of(context)!.enterPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !isPasswordVisible,
                      onChanged: (text) {},
                      validator: (value) => isValidPassword(value,
                              isRequired: true)
                          ? null
                          : AppLocalizations.of(context)!.enterValidPassword,
                      suffixIcon: isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      suffixIconOntap: () {
                        passwordVisibility.value = !passwordVisibility.value;
                      },
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    AppLocalizations.of(context)!.passwordRequirements,
                    size: TextSize.bodyLarge,
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: ispasswordAllist6caratters,
                  builder: (context, isChecked, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1.3, // Adjust this value to control the size
                          child: Checkbox(
                            shape: const CircleBorder(),
                            value: isChecked,
                            onChanged: (newValue) {
                              ispasswordAllist6caratters.value = newValue!;
                            },
                            activeColor: const Color.fromARGB(45, 31, 204, 120),
                            checkColor: AppThemes.primaryColor,
                          ),
                        ),
                        CustomText(
                          AppLocalizations.of(context)!
                              .passwordRequirementMinLength,
                          size: TextSize.bodyMedium,
                          textAlign: TextAlign.center,
                          color: ispasswordAllist6caratters.value
                              ? AppThemes.mainTextColor
                              : null,
                        ),
                      ],
                    );
                  },
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: ispasswordContainaNumber,
                  builder: (context, isChecked, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1.3, // Adjust this value to control the size
                          child: Checkbox(
                            shape: const CircleBorder(),
                            value: isChecked,
                            onChanged: (newValue) {
                              ispasswordContainaNumber.value = newValue!;
                            },
                            activeColor: const Color.fromARGB(45, 31, 204, 120),
                            checkColor: AppThemes.primaryColor,
                          ),
                        ),
                        CustomText(
                          AppLocalizations.of(context)!
                              .passwordRequirementContainsNumber,
                          size: TextSize.bodyMedium,
                          textAlign: TextAlign.center,
                          color: ispasswordContainaNumber.value
                              ? AppThemes.mainTextColor
                              : null,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 72.h),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.done,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.push("/login");
                    }
                  },
                  borderRadius: 40,
                  width: 320.w,
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
