import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phones_market/core/utils/settings.dart';
import 'package:phones_market/theme/color_palette.dart';

import '../../../../l10n/locale_keys.g.dart';

class HotSalesItem extends StatelessWidget {
  final List homeStoreData;
  final int id;

  const HotSalesItem({
    Key? key,
    required this.homeStoreData,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 14, bottom: 26, right: 25),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            homeStoreData[id].picture,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        color: ColorPalette.black010035,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeStoreData[id].isNew
              ? CircleAvatar(
                  child: Text(
                    LocaleKeys.newOffer.tr(),
                    style: Theme.of(context).textTheme.caption,
                  ),
                  backgroundColor: ColorPalette.orangeFF6E4E,
                  radius: 14,
                )
              : const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeStoreData[id].title,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: ColorPalette.whiteFFFFFF, fontFamily: 'SFPro'),
              ),
              Text(
                homeStoreData[id].subtitle,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(
            width: 98,
            height: 23,
            child: TextButton(
              onPressed: () => {},
              child: Text(
                LocaleKeys.buyNow.tr(),
                style: Theme.of(context).textTheme.button,
              ),
              style: TextButton.styleFrom(
                backgroundColor: ColorPalette.whiteFFFFFF,
                padding: const EdgeInsets.all(0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
