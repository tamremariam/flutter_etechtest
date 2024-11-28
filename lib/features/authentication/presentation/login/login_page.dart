import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/core/uitils/image_constant.dart';
import 'package:etechtest/core/uitils/validation_functions.dart';
import 'package:etechtest/features/authentication/presentation/pages/login/bloc/login_bloc.dart';
import 'package:etechtest/features/wigets/custom_elevated_button.dart';
import 'package:etechtest/features/wigets/custom_text_field.dart';
import 'package:etechtest/features/wigets/progress_dialog_utils.dart';
import 'package:etechtest/shared/widgets/custom_snack_bar_widget.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    //i declar here because i use stateless widget it doesnot reload i cant looase my datas
    final ValueNotifier<bool> passwordVisibility = ValueNotifier<bool>(false);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginDataSendinState) {
            ProgressDialogUtils.showProgressDialog(context: context);
          }
          if (state is LoginFailedState) {
            SnackBarUtils.showSnackBar(context, message: state.message);
            ProgressDialogUtils.hideProgressDialog();
          }
          if (state is LoginSuccessfulState) {
            SnackBarUtils.showSnackBar(context, message: state.token);
            ProgressDialogUtils.hideProgressDialog();
            context.go("/landing");
          }
        },
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 107.h,
                ),
                CustomText(
                  AppLocalizations.of(context)!.welcomeBack,
                  size: TextSize.headlineMedium,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: CustomText(
                    AppLocalizations.of(context)!.pleaseEnterYourAccount,
                    size: TextSize.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                inputefilds(
                    Icons.email_outlined,
                    AppLocalizations.of(context)!.emailOrPhoneNumber,
                    emailController,
                    (text) {},
                    () {},
                    () {}, (inputString) {
                  if (inputString == null || inputString.isEmpty) {
                    return AppLocalizations.of(context)!.emailOrPhoneNumber;
                  }

                  final validationResult =
                      isValidEmailOrPhoneNumber(inputString);
                  if (validationResult == 1) {
                    return null;
                  } else if (validationResult == 2) {
                    return null;
                  } else {
                    return AppLocalizations.of(context)!.emailOrPhoneNumber;
                  }
                }, null, TextInputType.text, false, context),
                SizedBox(height: 16.h),
                ValueListenableBuilder<bool>(
                  valueListenable: passwordVisibility,
                  builder: (context, isPasswordVisible, child) {
                    return Padding(
                      padding: EdgeInsets.only(left: 19.81.w, right: 25.45.w),
                      child: CustomTextField(
                        prefixIcon: Icons.lock_outline_rounded,
                        backgroundcolor: Colors.transparent,
                        width: 384.74.h,
                        height: 60.h,
                        borderRadius: 40,
                        borderColor: AppThemes.outlineColor,
                        borderWidth: 2,
                        contentPadding: EdgeInsets.only(left: 28.w, top: 50.h),
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.enterPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isPasswordVisible,
                        onChanged: (text) {},
                        // validator: (value) => isValidPassword(value,
                        //         isRequired: true)
                        //     ? null
                        //     : AppLocalizations.of(context)!.enterValidPassword,
                        suffixIcon: isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        suffixIconOntap: () {
                          passwordVisibility.value = !passwordVisibility.value;
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 35.h),
                    child: InkWell(
                      onTap: () {
                        context.push("/passwordrecovery");
                      },
                      child: CustomText(
                        AppLocalizations.of(context)!.forgotPassword,
                        size: TextSize.headlineSmall,
                        // color: Appcolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 72.h),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.read<LoginBloc>().add(
                          LoninSendUserNameAndPasswordEvent(
                              emailController.text, passwordController.text));
                    }
                  },
                  borderRadius: 40,
                  width: 320.w,
                  height: 50.h,
                ),
                SizedBox(height: 24.h),
                CustomText(
                  AppLocalizations.of(context)!.orContinueWith,
                  size: TextSize.bodyMedium,
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  prefixIcon: ImageConstant.googleIcon,
                  text: AppLocalizations.of(context)!.google,
                  onPressed: () {
                    // context.push("/login");
                  },
                  color: AppThemes.secondaryColor,
                  borderRadius: 40,
                  width: 320.w,
                  height: 50.h,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      AppLocalizations.of(context)!.dontHaveAnyAccount,
                      size: TextSize.headlineSmall,
                      // color: Appcolor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () => context.push("/signup"),
                      child: CustomText(
                        AppLocalizations.of(context)!.signUp,
                        size: TextSize.headlineSmall,
                        color: AppThemes.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
