import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';
import 'package:phones_market/theme/color_palette.dart';

import '../../../../l10n/locale_keys.g.dart';

class BottomCartZone extends StatelessWidget {
  final CartEntity data;

  const BottomCartZone({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.black010035,
      child: Column(
        children: [
          Divider(
            color: ColorPalette.whiteFFFFFF.withOpacity(0.25),
            thickness: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.total.tr(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 15,
                            color: ColorPalette.whiteFFFFFF,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      LocaleKeys.delivery.tr(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 15,
                            color: ColorPalette.whiteFFFFFF,
                          ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        NumberFormat.simpleCurrency().format(data.total),
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: 15,
                              color: ColorPalette.whiteFFFFFF,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.delivery,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 15,
                            color: ColorPalette.whiteFFFFFF,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: ColorPalette.whiteFFFFFF.withOpacity(0.25),
            thickness: 1,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 54,
              margin: const EdgeInsets.only(
                left: 44,
                right: 44,
                top: 20,
                bottom: 20,
              ),
              decoration: const BoxDecoration(
                color: ColorPalette.orangeFF6E4E,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    LocaleKeys.checkout.tr(),
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 20,
                          color: ColorPalette.whiteFFFFFF,
                        ),
                  ),
                  // Text(
                  //   NumberFormat.simpleCurrency().format(data.price),
                  //   style: Theme.of(context).textTheme.headline4?.copyWith(
                  //     fontSize: 20,
                  //     color: ColorPalette.whiteFFFFFF,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
