// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({
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
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: color ?? ColorConstants.iconColor),
    );
  }
}
