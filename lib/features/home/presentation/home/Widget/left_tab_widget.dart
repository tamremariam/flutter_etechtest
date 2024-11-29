import 'package:etechtest/features/home/presentation/home/Widget/shimmer_grid_widget.dart';
import 'package:etechtest/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftTabWidget extends StatefulWidget {
  const LeftTabWidget({super.key});

  @override
  State<LeftTabWidget> createState() => _LeftTabWidgetState();
}

class _LeftTabWidgetState extends State<LeftTabWidget> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;
  bool lastpage = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoadingMore &&
        !lastpage) {
      context.read<HomeBloc>().add(HomeloadMoreresourcesEvent());

      setState(() {
        _isLoadingMore = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeRecourceLoadedState && _isLoadingMore) {
          if (state.lastpage) {
            setState(() {
              lastpage = true;
            });
          }
          setState(() {
            _isLoadingMore = false;
          });
        }
      },
      builder: (context, state) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeRecourceLoadedState) {
              return GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
                itemCount: state.resources.length +
                    (_isLoadingMore ? 1 : 0), // Add one more item if loading
                itemBuilder: (context, index) {
                  if (index < state.resources.length) {
                    final colorItem = state.resources[index];
                    final colorHex = colorItem.color;
                    final color =
                        Color(int.parse(colorHex!.replaceFirst('#', '0xFF')));
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        color: color,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              colorItem.name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Year: ${colorItem.year}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Pantone: ${colorItem.pantoneValue}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    // If we are loading, show shimmer at the bottom
                    return const ShimmerLoadingItem();
                  }
                },
              );
            }
            return const ShimmerGrid();
          },
        );
      },
    );
  }
}
