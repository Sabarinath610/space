import 'package:flutter/material.dart';

extension Gap on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension NavigationExtension on BuildContext {
  // Future<T?> showMyDialog<T>(
  //     {required Widget child, bool isDismissible = true}) {
  //   return showDialog<T>(
  //       context: this,
  //       builder: (context) => child,
  //       barrierDismissible: isDismissible);
  // }

  void showSuccessSnackBar(
    Widget child, {
    bool? isDismissible,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: child,
          backgroundColor: Colors.green,
          dismissDirection: isDismissible ?? true
              ? DismissDirection.down
              : DismissDirection.none,
          duration: duration ?? const Duration(seconds: 4),
        ),
      );
  }
}

extension PaddingHelper on Widget {
  Widget padAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
  Widget padSym({double v = 0, double h = 0}) => Padding(
    padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
    child: this,
  );
  Widget padOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );
}

extension MarginHelper on Widget {
  Widget marginAll(double value) =>
      Container(margin: EdgeInsets.all(value), child: this);
  Widget marginSym({double v = 0, double h = 0}) => Container(
    margin: EdgeInsets.symmetric(vertical: v, horizontal: h),
    child: this,
  );
  Widget marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Container(
    margin: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: this,
  );
}
