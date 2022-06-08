import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phones_market/core/resources/custom_icons.dart';

import '../../../../l10n/locale_keys.g.dart';
import 'category_button.dart';

class CategoryItem {
  final String buttonName;
  final String buttonIcon;

  const CategoryItem(
    this.buttonName,
    this.buttonIcon,
  );
}

class CategoryMenu extends StatelessWidget {
  final int activeButtonId;
  final List<CategoryItem> categories = [
    CategoryItem(LocaleKeys.categoryPhones.tr(), CustomIcons.categoryPhones),
    CategoryItem(LocaleKeys.categoryComputer.tr(), CustomIcons.categoryComputer),
    CategoryItem(LocaleKeys.categoryHealth.tr(), CustomIcons.categoryHealth),
    CategoryItem(LocaleKeys.categoryBooks.tr(), CustomIcons.categoryBooks),
    CategoryItem(LocaleKeys.categoryPhones.tr(), CustomIcons.categoryPhones),
  ];
  CategoryMenu({
    Key? key,
    required this.activeButtonId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 27),
      alignment: Alignment.centerLeft,
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: categories
            .asMap()
            .entries
            .map(
              (item) => CategoryButton(
                activeButtonId: item.key,
                buttonName: item.value.buttonName,
                buttonIcon: item.value.buttonIcon,
                isActive: (item.key == activeButtonId)
                    ? true
                    : false,
              ),
            )
            .toList(),
      ),
    );
  }
}
