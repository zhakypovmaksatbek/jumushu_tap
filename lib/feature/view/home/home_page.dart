// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';
import 'package:meenet/feature/model/job_model.dart';
import 'package:meenet/feature/view/detail/detail_page.dart';
import 'package:meenet/feature/view/home/home_mixin.dart';
import 'package:meenet/feature/widgets/search_widget.dart';
import 'package:meenet/feature/widgets/text_widgets/default_text.dart';
import 'package:meenet/feature/widgets/vacancy_card.dart';
import 'package:meenet/generated/locale_keys.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: Builder(builder: (context) {
        return RefreshIndicator.adaptive(
          onRefresh: fetchData,
          child: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                leading: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
                backgroundColor: Colors.white,
                floating: true,
                elevation: 0,
                surfaceTintColor: ColorConstants.white,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    LocaleKeys.project_name.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  //collapseMode: CollapseMode.pin,
                  centerTitle: false,
                ),
              ),
              const SearchWidget(),
              FutureBuilder(
                future: data,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
                  if (snapshot.hasError) {
                    return SliverFillRemaining(
                      child: Center(child: Text('Error: ${snapshot.error}')),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: snapshot.data!.length,
                      (BuildContext context, int index) {
                        final job = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(job: job),
                                  ));
                            },
                            child: VacancyCard(
                              companyName: job.companyName!,
                              location: job.location!,
                              experience: job.experience!,
                              workHours: job.workHours!,
                              workName: job.workName!,
                              whenShare: job.whenShare!,
                              salary: job.salary!,
                              description: job.responsibilities!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.white,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                color: ColorConstants.white, border: Border()),
            child: Column(
              children: [
                MyElevatedButton(
                  title: LocaleKeys.general_post_vacancies.tr(),
                  onTap: () {},
                  textColor: ColorConstants.white,
                  color: ColorConstants.blue,
                ),
                const SizedBox(height: 10),
                MyElevatedButton(
                  title: 'LogIn',
                  onTap: () {},
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(LocaleKeys.general_search.tr()),
            onTap: () {
              Navigator.pop(context); // Drawer'ı kapat
            },
          ),
          ListTile(
            title: Text(LocaleKeys.general_professions.tr()),
            onTap: () {
              Navigator.pop(context); // Drawer'ı kapat
            },
          ),
        ],
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    Key? key,
    required this.title,
    this.color,
    this.textColor,
    this.onTap,
  }) : super(key: key);
  final String title;
  final Color? color;
  final Color? textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.3,
          backgroundColor: color ?? const Color(0xffE2E2E4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8.0), // Köşe yarıçapını istediğiniz değere ayarlayın
          ),
        ),
        onPressed: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: DefaultText(
              title: title,
              color: textColor ?? ColorConstants.iconColor,
            ),
          ),
        ));
  }
}
