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
    return Flexible(
      child: Column(
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
            height: 8.h,
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CustomImageView(
                  imagePath: imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 10.0,
                right: 10.0,
                child: Heart(),
              )
            ],
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
      ),
    );
  }
}

class Heart extends StatefulWidget {
  const Heart({
    super.key,
  });

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: const Color.fromARGB(142, 0, 0, 0),
          borderRadius: BorderRadius.circular(15.w), // Circular corners
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.white,
          size: 24.0,
        ),
      ),
    );
  }
}
