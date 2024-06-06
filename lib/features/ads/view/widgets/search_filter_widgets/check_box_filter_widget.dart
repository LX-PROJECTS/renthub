import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class CheckBoxFilterWidget extends StatelessWidget {
  const CheckBoxFilterWidget(
      {super.key,
      required this.text,
      required this.onChanged,
      this.value = false});
  final String text;
  final void Function(bool? status) onChanged;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.spaces.space_150),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
                activeColor: context.colors.primary,
                value: value,
                onChanged: onChanged),
          ),
          Padding(
            padding: EdgeInsets.only(left: context.spaces.space_150),
            child: Text(
              text,
              style: context.typography.body,
            ),
          )
        ],
      ),
    );
  }
}
