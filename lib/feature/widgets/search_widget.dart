import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';
import 'package:meenet/generated/locale_keys.g.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(color: ColorConstants.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.navigate_next_outlined),
                    prefixIcon: const Icon(Icons.search_outlined),
                    hintText: LocaleKeys.general_search.tr(),
                    filled: true,
                    fillColor: ColorConstants.whiteGrey,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 18),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.tune_outlined,
                    size: 30,
                    color: ColorConstants.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
