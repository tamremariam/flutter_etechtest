import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/features/wigets/custom_image_view.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String time;
  final String authorimageUrl;

  const ItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
    required this.authorimageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CustomImageView(
                imagePath: authorimageUrl,
                width: 31.w,
                height: 31.h,
              ),
            ),
            SizedBox(width: 5.w),
            CustomText(
              author,
              size: TextSize.bodyMedium,
              color: AppThemes.mainTextColor,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CustomImageView(
            imagePath: imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title,
            size: TextSize.bodyLarge,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            AppLocalizations.of(context)!.foodDuration(time),
            size: TextSize.bodyMedium,
          ),
        ),
      ],
    );
  }
}
