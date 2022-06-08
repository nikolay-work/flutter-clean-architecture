import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/theme/color_palette.dart';

import '../../../../l10n/locale_keys.g.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value = '';
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32),
      margin: const EdgeInsets.only(top: 25, bottom: 14),
      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: TextField(
              onChanged: (text) {
                value = text;
              },
              style: Theme.of(context).textTheme.headline6,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 22.0, right: 10),
                  child: Icon(
                    Icons.search_outlined,
                    color: ColorPalette.orangeFF6E4E,
                  ),
                ),
                //border: const OutlineInputBorder(),
                filled: true,
                fillColor: ColorPalette.whiteFFFFFF,
                hintText: LocaleKeys.search.tr(),
                contentPadding:
                    const EdgeInsets.only(left: 54.0, top: 3, bottom: 0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: ColorPalette.whiteFFFFFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorPalette.whiteFFFFFF),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => {
                //print(value),
              },
              style: TextButton.styleFrom(
                backgroundColor: ColorPalette.orangeFF6E4E,
                shape: const CircleBorder(),
                minimumSize: const Size(34, 34),
              ),
              child: SvgPicture.asset(CustomIcons.searchFormButton),
            ),
          ),
        ],
      ),
    );
  }
}
