import 'package:etechtest/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPInput extends StatelessWidget {
  final List<TextEditingController> controllers;
  final ValueChanged<String> onChanged;

  const OTPInput({
    super.key,
    required this.controllers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return SizedBox(
            width: 60.w,
            height: 90.h,
            child: TextFormField(
              controller: controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 4,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(
                    color: AppThemes.primaryColor,
                    width: 4,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                counter: const SizedBox.shrink(),
              ),
              maxLength: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.length > 1) {
                  controllers[index].text = value[0];
                  controllers[index].selection = TextSelection.fromPosition(
                    const TextPosition(offset: 1),
                  );
                }

                if (value.isEmpty) {
                  if (index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                } else if (value.length == 1) {
                  if (index < 3) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                }

                onChanged(value);
              },
            ),
          );
        }),
      ),
    );
  }
}
