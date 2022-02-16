import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/theme/color_palette.dart';

class AppBarBackArrow extends StatelessWidget {
  const AppBarBackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 37,
          height: 37,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorPalette.black010035,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: SvgPicture.asset(CustomIcons.backArrowAppBar),
        ),
      ),
    );
  }
}
