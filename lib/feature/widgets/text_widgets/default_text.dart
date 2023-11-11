// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: color ?? ColorConstants.iconColor),
    );
  }
}
