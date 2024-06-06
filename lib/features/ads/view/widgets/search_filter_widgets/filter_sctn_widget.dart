import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

// filter section container

class FilterSctnWidget extends StatelessWidget {
  const FilterSctnWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.spaces.space_150, bottom: context.spaces.space_150),
      child: Container(
        padding: EdgeInsets.only(
            top: context.spaces.space_250, left: context.spaces.space_200),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: context.colors.border),
          borderRadius: BorderRadius.circular(context.spaces.space_150),
        ),
        child: child,
      ),
    );
  }
}
