import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final Text? text;
  final VoidCallback onPressed;
  final Color? color;
  final TextStyle? textStyle;
  final double borderRadius;
  final double padding;
  final double width;
  final double height;
  final BoxBorder? border;
  final EdgeInsetsGeometry? textpaddibg;
  final List<BoxShadow>? boxShadow;
  final IconData? icon;
  final Gradient? gradient;

  const CustomElevatedButton({
    super.key,
    this.text,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.borderRadius = 8.0,
    this.padding = 16.0,
    this.width = 320.0,
    this.height = 50.0,
    this.boxShadow,
    this.border,
    this.textpaddibg,
    this.icon,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
          border: border),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0, // To avoid double shadow
        ),
        onPressed: onPressed,
        child: Padding(
          padding: textpaddibg ?? const EdgeInsets.all(0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (text != null) text!,
                if (icon != null)
                  Icon(
                    icon,
                    size: 24.0.w,
                    color: textStyle?.color,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
