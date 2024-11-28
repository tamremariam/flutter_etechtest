import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/core/uitils/validation_functions.dart';
import 'package:etechtest/features/wigets/custom_elevated_button.dart';
import 'package:etechtest/features/wigets/custom_text_field.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 151.h,
              ),
              CustomText(
                AppLocalizations.of(context)!.passwordRecovery,
                size: TextSize.headlineMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: CustomText(
                  AppLocalizations.of(context)!.enterEmailToRecoverPassword,
                  size: TextSize.bodyMedium,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              inputefilds(
                  Icons.email_outlined,
                  AppLocalizations.of(context)!.enterYourEmail,
                  emailController,
                  (text) {},
                  () {},
                  () {}, (inputString) {
                if (inputString == null || inputString.isEmpty) {
                  return AppLocalizations.of(context)!.enterValidEmail;
                }

                final validationResult = isValidEmailOrPhoneNumber(inputString);
                if (validationResult == 1) {
                  return null;
                } else if (validationResult == 2) {
                  return null;
                } else {
                  return AppLocalizations.of(context)!.enterValidEmail;
                }
              }, null, TextInputType.text, false, context),
              SizedBox(height: 32.h),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.sendOTP,
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.push("/verifycode");
                  }
                },
                borderRadius: 40,
                width: 320.w,
                height: 50.h,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Padding inputefilds(
      IconData prefixIcon,
      String inputhint,
      TextEditingController controller,
      dynamic Function(String)? onChanged,
      dynamic Function()? onTap,
      dynamic Function()? suffixIconOntap,
      String? Function(String?)? validator,
      IconData? suffixIcon,
      TextInputType keyboardType,
      bool obscureText,
      BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 19.81.w, right: 25.45.w),
      child: Column(
        children: [
          CustomTextField(
            prefixIcon: prefixIcon,
            backgroundcolor: Colors.transparent,
            width: 384.74.h,
            height: 60.h,
            borderRadius: 40,
            borderColor: AppThemes.outlineColor,
            borderWidth: 2,
            contentPadding: EdgeInsets.only(left: 28.w, top: 50),
            controller: controller,
            hintText: inputhint,
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
            validator: validator,
            suffixIcon:
                suffixIcon != null ? Icons.visibility_off_outlined : null,
            suffixIconColor: suffixIcon != null ? AppThemes.primaryColor : null,
            onTap: onTap,
            suffixIconOntap: suffixIconOntap,
          ),
        ],
      ),
    );
  }
}
