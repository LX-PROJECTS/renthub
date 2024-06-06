import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/filters_sort_constants/filter_sort.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/bottom_sheet_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/check_box_filter_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/choose_location_field_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/filter_sctn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/tab_bar_widget.dart';

class OrderSortBottomSheet extends ConsumerWidget {
  const OrderSortBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // filter constants
    final filterConsts = ref.read(filterSortConstantsProvider);
    // text editing controller
    final controller = TextEditingController();

    return DefaultTabController(
      length: 5,
      child: SizedBox(
        width: double.infinity,
        height: context.spaces.space_900 * 6,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spaces.space_200,
            vertical: context.spaces.space_250,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filterConsts.txtHeading,
                    style: context.typography.h3SemiBold,
                  ),
                  // close bottom sheet
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: context.spaces.space_300,
                    ),
                  ),
                ],
              ),

              /// tabBar items
              const TabBarWidget(),
              Expanded(
                child: TabBarView(
                  children: [
                    FilterSctnWidget(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          // product type filter
                          children: [
                            for (int i = 0;
                                i < filterConsts.productType.length;
                                i++)
                              CheckBoxFilterWidget(
                                text: filterConsts.productType[i],
                                onChanged: (status) {},
                                value: true,
                              ),
                          ],
                        ),
                      ),
                    ),
                    // location based filter
                    FilterSctnWidget(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: context.spaces.space_400,
                            top: context.spaces.space_400),
                        child: ChooseLocationFieldWidget(
                            controller: controller,
                            hintText: filterConsts.txtEnterLocation),
                      ),
                    ),
                    // filter with price range
                    FilterSctnWidget(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < filterConsts.priceRange.length;
                                i++)
                              CheckBoxFilterWidget(
                                  text: filterConsts.priceRange[i],
                                  onChanged: (status) {}),
                          ],
                        ),
                      ),
                    ),
                    // sorting
                    FilterSctnWidget(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < filterConsts.sortBy.length; i++)
                              CheckBoxFilterWidget(
                                text: filterConsts.sortBy[i],
                                onChanged: (status) {},
                              ),
                          ],
                        ),
                      ),
                    ),
                    // choose order
                    FilterSctnWidget(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < filterConsts.orderedBy.length;
                                i++)
                              CheckBoxFilterWidget(
                                  text: filterConsts.orderedBy[i],
                                  onChanged: (status) {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterBottomSheetBtn(
                    onTap: () {
                      // TODO
                    },
                    color: context.colors.secondary,
                    text: filterConsts.txtResetAllBtn,
                  ),
                  FilterBottomSheetBtn(
                      onTap: () {
                        // TODO
                      },
                      color: context.colors.primary,
                      text: filterConsts.txtApplyBtn)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
