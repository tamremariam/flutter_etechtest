import 'package:etechtest/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color? fontcolor;
  final double borderRadius;
  final double padding;
  final double width;
  final double height;
  final Color? borderColor;
  final double? borderWidth;
  final List<BoxShadow>? boxShadow;
  final String? prefixIcon;
  final Color? prefixIconColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppThemes.primaryColor,
    // Set a default text style with GoogleFonts.inter

    this.borderRadius = 8.0,
    this.padding = 16.0,
    this.width = 320.0,
    this.height = 50.0,
    this.boxShadow,
    this.borderColor,
    this.borderWidth,
    this.fontcolor,
    this.prefixIcon,
    this.prefixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: borderColor ?? Colors.transparent, // Default border color
          width: borderWidth ?? 0, // Default border width
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0, // To avoid double shadow
        ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixIcon != null
                  ? Row(
                      children: [
                        Iconify(
                          prefixIcon!,
                          color: prefixIconColor,
                          size: 17.sp,
                        ),
                        SizedBox(width: 5.w),
                      ],
                    )
                  : const SizedBox.shrink(),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  color: fontcolor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
