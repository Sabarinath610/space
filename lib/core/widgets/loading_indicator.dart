import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry padding;

  const LoadingIndicator({
    super.key,
    this.size = 36,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}
