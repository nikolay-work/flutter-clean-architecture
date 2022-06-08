import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';
import 'package:phones_market/theme/color_palette.dart';

import '../../../../l10n/locale_keys.g.dart';

class SpecificationsAdd extends StatelessWidget {
  final DetailEntity data;

  const SpecificationsAdd({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/cart', arguments: data.id);
      },
      child: Container(
        height: 54,
        decoration: const BoxDecoration(
          color: ColorPalette.orangeFF6E4E,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    LocaleKeys.addToCart.tr(),
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 20,
                          color: ColorPalette.whiteFFFFFF,
                        ),
                  ),
                ),
                Text(
                  NumberFormat.simpleCurrency().format(data.price),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 20,
                        color: ColorPalette.whiteFFFFFF,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
