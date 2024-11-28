import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final void Function(int) onCategorySelected;
  final bool? borderavailable;

  const CategoryFilter(
      {super.key,
      required this.categories,
      required this.selectedIndex,
      required this.onCategorySelected,
      this.borderavailable = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: categories.asMap().entries.map((entry) {
          int index = entry.key;
          String label = entry.value;
          return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 20.0.w),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? AppThemes.primaryColor
                      : borderavailable != true
                          ? AppThemes.outlineColor
                          : Colors.transparent,
                  border: borderavailable == true && index != selectedIndex
                      ? Border.all(
                          color: AppThemes.outlineColor,
                          width: 4.0,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Center(
                  child: CustomText(
                    label,
                    size: TextSize.bodyMedium,
                    color: index == selectedIndex
                        ? AppThemes.formBackgroundColor
                        : AppThemes.mainTextColor,
                  ),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
