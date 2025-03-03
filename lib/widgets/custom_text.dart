import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color fontColor;
  final TextAlign textAlign;
  final FontWeight weight;
  final bool underlined, lineThrough;
  final String? fontFamily;
  final double fontSize, lineSpacing, letterSpacing;
  final int? maxLines;
  final TextOverflow overflow;
  const CustomText({
    super.key,
    this.text,
    this.fontColor = AppColors.black,
    this.fontSize = 15,
    this.textAlign = TextAlign.start,
    this.weight = FontWeight.normal,
    this.underlined = false,
    this.lineSpacing = 1,
    this.letterSpacing = 0,
    this.maxLines,
    this.fontFamily,
    this.overflow = TextOverflow.ellipsis,
    this.lineThrough = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : overflow,
      textAlign: textAlign,
      softWrap: true,
      style: TextStyle(
        color: fontColor,
        fontWeight: weight,
        height: lineSpacing,
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontFamily: fontFamily,
        decorationThickness: 1.0,
        decoration: underlined
            ? TextDecoration.underline
            : (lineThrough ? TextDecoration.lineThrough : TextDecoration.none),
      ),
    );
  }
}
