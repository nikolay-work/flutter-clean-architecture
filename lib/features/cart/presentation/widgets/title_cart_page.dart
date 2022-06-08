import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/locale_keys.g.dart';

class TitleCartPage extends StatelessWidget {
  const TitleCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 42,
        top: 50,
        bottom: 49,
      ),
      child: Text(
          LocaleKeys.myCart.tr(),
        style:
        Theme.of(context).textTheme.headline1?.copyWith(fontSize: 35),
      ),
    );
  }
}