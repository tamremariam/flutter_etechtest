import 'package:etechtest/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextSize {
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
}

class CustomText extends StatelessWidget {
  final String text;
  final TextSize size;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const CustomText(
    this.text, {
    super.key,
    this.size = TextSize.bodyMedium, // Default to a common style
    this.color,
    this.textAlign,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    // Select the appropriate TextTheme based on theme brightness
    final textTheme = Theme.of(context).brightness == Brightness.dark
        ? AppThemes.darkTheme.textTheme
        : AppThemes.lightTheme.textTheme;

    // Determine the default color based on theme brightness

    // Select the appropriate TextStyle based on the TextSize parameter
    TextStyle? selectedStyle;
    switch (size) {
      case TextSize.headlineLarge:
        selectedStyle = textTheme.headlineLarge;
        break;
      case TextSize.headlineMedium:
        selectedStyle = textTheme.headlineMedium;
        break;
      case TextSize.headlineSmall:
        selectedStyle = textTheme.headlineSmall;
        break;

      case TextSize.bodyLarge:
        selectedStyle = textTheme.bodyLarge;
        break;
      case TextSize.bodyMedium:
        selectedStyle = textTheme.bodyMedium;
        break;
      case TextSize.bodySmall:
        selectedStyle = textTheme.bodySmall;
        break;
    }

    final effectiveColor = color ?? selectedStyle?.color;

    // Apply the Google Fonts "Inter" font family
    final effectiveStyle = GoogleFonts.inter(
      textStyle: selectedStyle?.copyWith(
        color: effectiveColor,
        fontWeight: fontWeight ?? selectedStyle.fontWeight,
      ),
    );

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
    );
  }
}
