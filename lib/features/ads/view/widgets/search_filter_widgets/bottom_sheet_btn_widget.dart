import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class FilterBottomSheetBtn extends StatelessWidget {
  const FilterBottomSheetBtn(
      {super.key,
      required this.color,
      required this.text,
      required this.onTap});
  final void Function()? onTap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.spaces.space_900 * 2.3,
        height: context.spaces.space_600,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(context.spaces.space_900)),
        child: Center(
          child: Text(
            text,
            style: context.typography.buttonText,
          ),
        ),
      ),
    );
  }
}
