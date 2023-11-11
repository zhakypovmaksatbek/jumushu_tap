// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';
import 'package:meenet/feature/widgets/company_info.dart';
import 'package:meenet/feature/widgets/text_widgets/default_text.dart';
import 'package:meenet/feature/widgets/text_widgets/title_text.dart';

class VacancyCard extends StatelessWidget {
  const VacancyCard({
    Key? key,
    required this.companyName,
    required this.location,
    required this.experience,
    required this.workHours,
    required this.workName,
    required this.whenShare,
    required this.salary,
    required this.description,
  }) : super(key: key);
  final String companyName;
  final String location;
  final String experience;
  final String workHours;
  final String workName;
  final String whenShare;
  final String salary;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorConstants.whiteGrey,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [TitleText(title: workName), Text(salary)],
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.star_border_rounded),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Text(description,
                  overflow: TextOverflow.ellipsis, maxLines: 2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CompanyInfo(
                  companyName: companyName,
                  location: location,
                  experience: experience,
                  workHours: workHours,
                ),
                DefaultText(title: whenShare)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
