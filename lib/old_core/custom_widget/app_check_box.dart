import 'package:flutter/material.dart';
import 'package:space/old_core/extensions/widget_extensions.dart';

import 'app_text.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle? textStyle;

  const AppCheckBox({super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: <Widget>[
          Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: value ? activeColor : inactiveColor,
                width: 2.0,
              ),
            ),
            child: value
                ? Center(
              child: Container(
                height: 12.0,
                width: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: activeColor,
                ),
              ),
            )
                : null,
          ),
          12.w,
          appText(label,textColor: value ? activeColor : inactiveColor),
        ],
      ),
    );
  }
}