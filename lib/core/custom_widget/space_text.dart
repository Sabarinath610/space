import 'package:flutter/material.dart';


Text customText(String text,
    {FontWeight fontWeight = FontWeight.normal,
    int? maxLine,
    double? fontSize,
    Color? textColor,
    TextAlign textAlign = TextAlign.start,
    bool softWarp = false,
    bool underLine = false,
    TextOverflow textOverFlow = TextOverflow.clip,
    double? height}) {
  return Text(
    text,
    softWrap: softWarp,
    maxLines: maxLine,
    textAlign: textAlign,
    style: TextStyle(
      height: height,
      color: textColor?? Colors.black,
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight,
      decoration: underLine ? TextDecoration.underline : null,
      decorationColor: underLine ? textColor : null,
      fontFamily: 'Urbanist'
    ),
  );
}
