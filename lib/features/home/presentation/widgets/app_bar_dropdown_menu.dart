import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/theme/color_palette.dart';

class AppBarDropdownMenu extends StatelessWidget {
  final List<String> itemsList = [
    "Zihuatanejo, Gro",
    "Second Item",
    "Third Item",
    "Fourth Item",
  ];
  AppBarDropdownMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        onTap: () => Navigator.pushNamed(context, '/map'),
        underline: const SizedBox(),
        icon: Container(
          child: SvgPicture.asset(CustomIcons.expandMoreAppBar),
          padding: const EdgeInsets.only(left: 7),
        ),
        value: 0,
        elevation: 0,
        items: itemsList
            .asMap()
            .entries
            .map(
              (item) => DropdownMenuItem(
                  child: Text(
                    item.value,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: ColorPalette.black010035),
                  ),
                  value: item.key),
            )
            .toList(),
        onChanged: (value) {}
    );
  }
}
