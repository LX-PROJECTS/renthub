import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/filters_sort_constants/filter_sort.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class TabBarWidget extends ConsumerWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterConsts = ref.read(filterSortConstantsProvider);
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      dividerHeight: 0,
      labelColor: context.colors.primary,
      indicatorColor: Colors.transparent,
      labelPadding: EdgeInsets.only(right: context.spaces.space_300),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelStyle: context.typography.bodySemibold,
      tabs: [
        for (int i = 0; i < filterConsts.filterOptions.length; i++)
          Tab(text: filterConsts.filterOptions[i]),
      ],
    );
  }
}
