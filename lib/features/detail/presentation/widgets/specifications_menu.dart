import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

import '../../../../l10n/locale_keys.g.dart';

class SpecificationsMenu extends StatelessWidget {
  const SpecificationsMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.shop.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const Divider(
                      color: ColorPalette.orangeFF6E4E,
                      thickness: 3,
                      height: 8,
                      indent: 4,
                      endIndent: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Expanded(
              flex: 1,
              child: Text(
                LocaleKeys.details.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  LocaleKeys.features.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}