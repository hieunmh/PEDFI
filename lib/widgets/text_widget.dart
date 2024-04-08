// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.isTitle = false,
  });

  final String text;
  final double fontSize;
  final Color color;
  bool isTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
    );
  }
}
