import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SvgPicture svgImageAssets({
  String? image,
  String? label,
  double? width,
  double? height,
  Color? color,
  Clip? clip,
}) {
  return SvgPicture.asset(
    "$image",
    height: height,
    width: width,
    semanticsLabel: label,
    fit: BoxFit.contain,
    color: color,
    clipBehavior: clip??Clip.hardEdge,
  );
}
