import 'package:flutter/material.dart';
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
        children: List.generate(5, (index) {
          return SizedBox(
            width: 60.w,
            height: 60.h,
            child: TextField(
              controller: controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                // filled: true, // Enable background color
                // fillColor: const Color.fromARGB(90, 158, 158, 158),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                      color: Colors.green, width: 2), // Color when focused
                ),
                contentPadding: EdgeInsets.zero,
                counter: const SizedBox.shrink(), // Hide the counter
              ),
              maxLength: 1,
              onChanged: (value) {
                // Handle value input and backspace
                if (value.length > 1) {
                  // If more than one character is entered, keep only the first character
                  controllers[index].text = value[0];
                  controllers[index].selection = TextSelection.fromPosition(
                    const TextPosition(offset: 1),
                  );
                }

                // Handle backspace functionality
                if (value.isEmpty) {
                  // Move focus to the previous field if backspace is pressed
                  if (index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                } else if (value.length == 1) {
                  if (index < 4) {
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
