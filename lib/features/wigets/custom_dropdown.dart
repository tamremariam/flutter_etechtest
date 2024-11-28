// import 'package:flutter/material.dart';
// import 'package:tenamahider/theme/colors.dart';
// import 'package:tenamahider/theme/text_styles.dart';

// class CustomDropdown extends StatelessWidget {
//   final String? value;
//   final List<DropdownMenuItem<String>> items;
//   final Function(String?)? onChanged;
//   final String hintText;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final Color? prefixIconColor;
//   final Color? suffixIconColor;
//   final bool enabled;
//   final Color borderColor;
//   final Color focusedBorderColor;
//   final double? focusedBorderWidth;
//   final TextStyle? textStyle;
//   final EdgeInsetsGeometry? contentPadding;
//   final double? height;
//   final double? width;
//   final Color? backgroundColor;
//   final double? borderRadius;
//   final double? borderWidth;
//   final TextStyle? hintStyle;
//   final String? Function(String?)? validator;

//   const CustomDropdown({
//     super.key,
//     this.value,
//     required this.items,
//     required this.onChanged,
//     required this.hintText,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.prefixIconColor,
//     this.suffixIconColor,
//     this.enabled = true,
//     this.borderColor = Colors.grey,
//     this.focusedBorderColor = Colors.black,
//     this.focusedBorderWidth = 2.0,
//     this.textStyle,
//     this.contentPadding,
//     this.height,
//     this.width,
//     this.backgroundColor,
//     this.borderRadius = 10.0,
//     this.borderWidth = 1.0,
//     this.hintStyle,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? double.infinity,
//       height: height ?? 60.0,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? Colors.grey,
//         borderRadius: BorderRadius.circular(borderRadius!),
//         border: Border.all(color: borderColor, width: borderWidth!),
//       ),
//       padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 10.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         items: items,
//         onChanged: enabled ? onChanged : null,
//         decoration: InputDecoration(
//           isDense: true,
//           border: InputBorder.none,
//           prefixIcon: prefixIcon != null
//               ? Icon(prefixIcon, color: prefixIconColor)
//               : null,
//           suffixIcon: suffixIcon != null
//               ? Icon(suffixIcon, color: suffixIconColor)
//               : null,
//           hintText: hintText,
//           hintStyle: hintStyle ?? AppTextStyles.hint,
//           contentPadding: EdgeInsets.zero,
//         ),
//         style: textStyle ?? AppTextStyles.buttonText,
//         validator: validator,
//         dropdownColor: backgroundColor ?? Colors.white,
//         icon: const Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
//       ),
//     );
//   }
// }
//---------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:tenamahider/core/theme/text_styles.dart';

// class CustomDropdownMenu<T> extends StatelessWidget {
//   final List<T> items;
//   final T? selectedItem;
//   final String? hint;
//   final ValueChanged<T?>? onChanged;
//   final Color borderColor;
//   final Color focusedBorderColor;
//   final Color dropdownColor;
//   final double borderRadius;
//   final double borderWidth;
//   final EdgeInsetsGeometry? contentPadding;
//   final double? width;
//   final double? height;

//   const CustomDropdownMenu({
//     super.key,
//     required this.items,
//     this.selectedItem,
//     this.hint,
//     this.onChanged,
//     this.borderColor = Colors.grey,
//     this.focusedBorderColor = Colors.black,
//     this.dropdownColor = Colors.white,
//     this.borderRadius = 8.0,
//     this.borderWidth = 1.0,
//     this.contentPadding,
//     this.width,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: DropdownButtonFormField<T>(
//         icon: const Icon(
//           IconsaxPlusLinear.arrow_down,
//           size: 20,
//         ),
//         value: selectedItem,
//         hint: Text(hint ?? 'Select an item', style: AppTextStyles.hint),
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: dropdownColor,
//           contentPadding: contentPadding ??
//               const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: borderColor, width: borderWidth),
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: focusedBorderColor, width: borderWidth + 1),
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//         ),
//         items: items.map((T item) {
//           return DropdownMenuItem<T>(
//             value: item,
//             child: Text(item.toString()), // Customize as needed
//           );
//         }).toList(),
//         isExpanded: true,
//       ),
//     );
//   }
// }
