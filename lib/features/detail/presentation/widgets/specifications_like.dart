import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/theme/color_palette.dart';

class SpecificationsLike extends StatelessWidget {
  const SpecificationsLike({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 37,
          width: 37,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: ColorPalette.black010035,
            borderRadius: BorderRadius.all(
              Radius.circular(11),
            ),
          ),
          child: SvgPicture.asset(CustomIcons.specificationsLike),
        ),
      ),
    );
  }
}
