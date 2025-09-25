import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final bool isLoading;
  final double? blurRadius;
  const AppButton({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    this.borderColor,
    this.onTap,
    required this.isLoading,
    this.blurRadius = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1)
                : BorderSide.none,
          ),
          shadows: [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: blurRadius!,
              offset: const Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: isLoading ? 0.0 : 1.0,
              child: appText(
                label,
                textColor: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (isLoading)
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.yellowAccent,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
