import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

class AppBarAction extends StatelessWidget {
  final Widget iconWidget;

  const AppBarAction({
    Key? key,
    required this.iconWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 37,
          height: 37,
          margin: const EdgeInsets.only(right: 37),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorPalette.orangeFF6E4E,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: iconWidget,
        ),
      ),
    );
  }
}
