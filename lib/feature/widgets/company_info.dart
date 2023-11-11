// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';

import 'text_widgets/default_text.dart';

class CompanyInfo extends StatelessWidget {
  final String companyName;
  final String location;
  final String experience;
  final String workHours;

  const CompanyInfo({
    super.key,
    required this.companyName,
    required this.location,
    required this.experience,
    required this.workHours,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRow(Icons.location_city_outlined, companyName),
        _buildRow(Icons.location_on, location),
        _buildRow(Icons.filter_frames_outlined, experience),
        _buildRow(Icons.timelapse_rounded, workHours),
      ],
    );
  }

  Padding _buildRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: ColorConstants.iconColor,
            ),
          ),
          DefaultText(title: text)
        ],
      ),
    );
  }
}
