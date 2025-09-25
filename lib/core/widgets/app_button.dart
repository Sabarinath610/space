import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? leading;
  final double height;
  final bool fullWidth;

  const AppButton({
    super.key,
    this.label,
    this.child,
    required this.onPressed,
    this.isLoading = false,
    this.leading,
    this.height = 48,
    this.fullWidth = true,
  }) : assert(label != null || child != null, '');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content =
        child ??
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[
              Icon(leading, size: 18),
              const SizedBox(width: 8),
            ],
            Flexible(child: Text(label!, overflow: TextOverflow.ellipsis)),
          ],
        );

    return SizedBox(
      height: height,
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: theme.textTheme.labelLarge,
        ),
        child: isLoading
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(
                    theme.colorScheme.onPrimary,
                  ),
                ),
              )
            : content,
      ),
    );
  }
}
