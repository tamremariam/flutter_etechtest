import 'package:etechtest/core/uitils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/features/home/presentation/home/Widget/category_filter_widget.dart';
import 'package:etechtest/features/home/presentation/home/Widget/item_card_widget.dart';
import 'package:etechtest/features/home/presentation/home/Widget/left_tab_widget.dart';
import 'package:etechtest/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:etechtest/features/wigets/custom_text_field.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;

  void onCategorySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  late TabController tabController;

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeloadresourcesEvent());

    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 19.81.w, right: 25.45.w),
            child: CustomTextField(
              prefixIcon: Icons.search,
              width: 384.74.h,
              height: 60.h,
              borderRadius: 40,
              readOnly: true,
              borderColor: AppThemes.outlineColor,
              backgroundcolor: AppThemes.formBackgroundColor,
              borderWidth: 2,
              contentPadding: EdgeInsets.only(left: 28.w, top: 50.h),
              controller: TextEditingController(),
              hintText: AppLocalizations.of(context)!.search,
              onChanged: (text) {},
              onTap: () => context.push("/search"),
            ),
          ),
          SizedBox(
            height: 20.h,
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
          CategoryFilter(
            categories: const ["All", "Food", "Drink"],
            selectedIndex: selectedIndex,
            onCategorySelected: onCategorySelected,
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            color: AppThemes.formBackgroundColor,
            height: 16.h,
            width: double.infinity,
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            tabs: [
              Tab(text: AppLocalizations.of(context)!.left),
              Tab(text: AppLocalizations.of(context)!.right),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                const LeftTabWidget(),

                // const Center(child: Text("Right Tab Content")),
                GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      imageUrl: index % 2 == 0
                          ? ImageConstant.imagePlaceholder
                          : ImageConstant.imageSalad,
                      title: index % 2 == 0 ? "Pancake" : "Salad",
                      author: index % 2 == 0 ? "Calum Lewis" : "Elif Sonas",
                      authorimageUrl: index % 2 == 0
                          ? ImageConstant.imageauthor2
                          : ImageConstant.imageauthor1,
                      time: ">60",
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
