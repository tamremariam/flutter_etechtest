import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? suffixIconOntap;
  final bool enabled;
  final Color borderColor;
  final Color focusedBorderColor;
  final double? focusedBorderwidth;
  final Color cursorColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  // final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final double? width;
  final Color? backgroundcolor;
  final double? borderRadius;
  final double? borderWidth;
  final EdgeInsetsGeometry? textpadding;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final bool? readOnly;
  final bool? roundborder;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.black,
    this.cursorColor = const Color(0xffF3F3F3),
    this.textStyle,
    this.contentPadding,
    // this.inputFormatters,
    this.height,
    this.width,
    this.backgroundcolor,
    this.borderRadius,
    this.borderWidth,
    this.textpadding,
    this.validator,
    this.suffixIconColor,
    this.prefixIconColor,
    this.hintStyle,
    this.readOnly,
    this.focusedBorderwidth,
    this.suffixIconOntap,
    this.roundborder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onChanged: onChanged, validator: validator,
        onTap: onTap,
        enabled: enabled,
        // cursorColor: cursorColor,
        style: textStyle ?? const TextStyle(color: Colors.black),
        // inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          filled: true,
          prefixIcon: prefixIcon != null
              ? InkWell(
                  onTap: () {}, child: Icon(prefixIcon, color: prefixIconColor))
              : null,
          suffixIcon: suffixIcon != null
              ? InkWell(
                  onTap: suffixIconOntap,
                  child: Icon(suffixIcon, color: suffixIconColor))
              : null,
          fillColor: backgroundcolor,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          enabledBorder: !roundborder!
              ? UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: borderColor, width: borderWidth ?? 1.0),
                )
              : OutlineInputBorder(
                  borderSide:
                      BorderSide(color: borderColor, width: borderWidth ?? 1.0),
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                ),
          errorBorder: !roundborder!
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                )
              : OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          focusedBorder: !roundborder!
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red, width: focusedBorderwidth ?? 2.0),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusedBorderColor,
                      width: focusedBorderwidth ?? 2.0),
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                ),
        ),
      ),
    );
  }
}

enum BorderType { underline, rounded }
