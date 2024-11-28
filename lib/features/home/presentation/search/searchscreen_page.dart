import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/features/home/presentation/home/Widget/category_filter_widget.dart';
import 'package:etechtest/features/wigets/custom_elevated_button.dart';
import 'package:etechtest/features/wigets/custom_text_field.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SearchscreenPage extends StatefulWidget {
  const SearchscreenPage({super.key});

  @override
  State<SearchscreenPage> createState() => _SearchscreenPageState();
}

class _SearchscreenPageState extends State<SearchscreenPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => context.pop,
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppThemes.mainTextColor,
                      size: 30.sp,
                    )),
                Flexible(
                  child: CustomTextField(
                    prefixIcon: Icons.search,
                    width: 384.74.h,
                    height: 60.h,
                    borderRadius: 40,
                    borderColor: AppThemes.outlineColor,
                    backgroundcolor: AppThemes.formBackgroundColor,
                    borderWidth: 2,
                    contentPadding: EdgeInsets.only(left: 28.w, top: 30.h),
                    controller: searchController,
                    hintText: AppLocalizations.of(context)!.search,
                    onChanged: (text) {},
                    suffixIcon: Icons.cancel,
                    suffixIconColor: AppThemes.mainTextColor,
                    suffixIconOntap: () {},
                  ),
                ),
                IconButton(
                    onPressed: () => showSearchModal(context),
                    icon: Icon(
                      Icons.tune_outlined,
                      color: AppThemes.mainTextColor,
                      size: 30.sp,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            color: AppThemes.formBackgroundColor,
            height: 18.h,
            width: double.infinity,
          ),
          serchhistory("Pancakes"),
          serchhistory("Salad"),
          Container(
            color: AppThemes.formBackgroundColor,
            height: 18.h,
            width: double.infinity,
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: CustomText(
                AppLocalizations.of(context)!.searchSuggestions,
                size: TextSize.bodyLarge,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: Wrap(
                  spacing: 10.0, // Horizontal space between items
                  runSpacing: 10.0, // Vertical space between lines
                  children: [
                    sugention("sushi"),
                    sugention("Salad"),
                    sugention("Seafood"),
                    sugention("Fried Ice"),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget sugention(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 20.0.w),
      decoration: BoxDecoration(
        color: AppThemes.formBackgroundColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: CustomText(
            title,
            size: TextSize.bodyMedium,
            color: AppThemes.mainTextColor,
          ),
        ),
      ),
    );
  }

  Widget serchhistory(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              const Icon(
                Icons.history_outlined,
                color: AppThemes.mainTextColor,
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                title,
                size: TextSize.bodyLarge,
              ),
            ],
          ),
          const Icon(
            Icons.north_west_outlined,
            color: AppThemes.mainTextColor,
          ),
        ],
      ),
    );
  }
}

void showSearchModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allow modal to occupy more space

    builder: (BuildContext context) {
      int selectedIndex = 0;

      // Method to handle category selection
      void onCategorySelected(int index) {
        // setState(() {
        //   selectedIndex = index; // Update the selected index
        // });
      }
      final ValueNotifier<double> sliderValueNotifier = ValueNotifier(0.0);
      return FractionallySizedBox(
          heightFactor: 0.6, // Adjust height as needed
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(35.0)), // Clip to rounded shape
            child: Container(
              color: AppThemes.formBackgroundColor, // Set background color
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: CustomText(
                          AppLocalizations.of(context)!.addFilter,
                          size: TextSize.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomText(
                          AppLocalizations.of(context)!.category,
                          size: TextSize.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CategoryFilter(
                      categories: const ["All", "Food", "Drink"],
                      selectedIndex: selectedIndex,
                      borderavailable: true,
                      onCategorySelected: onCategorySelected,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomText(
                          AppLocalizations.of(context)!.cookingDuration,
                          size: TextSize.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ValueListenableBuilder<double>(
                      valueListenable: sliderValueNotifier,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    "<10",
                                    size: TextSize.bodyLarge,
                                    color: sliderValueNotifier.value >= 10
                                        ? AppThemes.primaryColor
                                        : null,
                                  ),
                                  CustomText(
                                    "30",
                                    size: TextSize.bodyLarge,
                                    color: sliderValueNotifier.value >= 30
                                        ? AppThemes.primaryColor
                                        : null,
                                  ),
                                  CustomText(
                                    ">60",
                                    size: TextSize.bodyLarge,
                                    color: sliderValueNotifier.value >= 60
                                        ? AppThemes.primaryColor
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Slider.adaptive(
                              value: value,
                              min: 0.0,
                              max: 60.0,

                              activeColor: AppThemes.primaryColor,
                              inactiveColor: Colors.grey[300],
                              // thumbColor: Colors.amber,
                              divisions: 100,

                              onChanged: (newValue) {
                                sliderValueNotifier.value =
                                    newValue; // Update the value
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButton(
                            text: AppLocalizations.of(context)!.cancelbutton,
                            onPressed: () {
                              // context.push("/login");
                            },
                            color: AppThemes.outlineColor,
                            fontcolor: AppThemes.mainTextColor,
                            borderRadius: 40,
                            width: 130.w,
                            height: 50.h,
                          ),
                          CustomElevatedButton(
                            text: AppLocalizations.of(context)!.done,
                            onPressed: () {},
                            borderRadius: 40,
                            width: 130.w,
                            height: 50.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    },
  );
}
