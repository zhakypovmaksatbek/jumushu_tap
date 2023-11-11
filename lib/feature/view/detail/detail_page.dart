// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';
import 'package:meenet/feature/model/job_model.dart';
import 'package:meenet/feature/widgets/text_widgets/default_text.dart';
import 'package:meenet/feature/widgets/text_widgets/title_text.dart';
import 'package:meenet/generated/locale_keys.g.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.job});

  final Job job;
  DetailPage copyWith({Job? job}) {
    return DetailPage(
      job: job ?? this.job,
      // Diğer özellikleri de kopyalayabilirsiniz.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          title: LocaleKeys.project_name.tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(title: job.workName!),
                        DefaultText(
                            title: job.salary ?? "Not info is for Salary"),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: DefaultText(title: job.location ?? "")),
                        DefaultText(
                            title: "${job.workHours} / ${job.experience}")
                      ],
                    ),
                    InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.star_border_rounded,
                          color: ColorConstants.iconColor,
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MyContainer(
                  color: ColorConstants.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        title: job.companyName ?? "Not found",
                        color: ColorConstants.blue,
                      ),
                      DefaultText(
                        title:
                            "${job.vacancies.toString()} ${LocaleKeys.general_vacancies.tr()}",
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
              MyContainer(
                  color: ColorConstants.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                          title: LocaleKeys.general_responsibilities.tr()),
                      DefaultText(title: job.responsibilities ?? "Not Found"),
                      const SizedBox(height: 20),
                      TitleText(title: LocaleKeys.general_requirements.tr()),
                      DefaultText(title: job.requirements ?? "Not found"),
                      const SizedBox(height: 20),
                      TitleText(title: LocaleKeys.general_contacts.tr()),
                      Row(
                        children: [
                          DefaultText(title: job.name ?? ""),
                          const SizedBox(width: 10),
                          SelectableText(
                            job.phone ?? "Not found",
                            style: const TextStyle(color: ColorConstants.blue),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? ColorConstants.whiteGrey),
      child: child,
    );
  }
}
