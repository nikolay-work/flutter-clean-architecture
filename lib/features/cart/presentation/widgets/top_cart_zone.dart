import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

class TopCartZone extends StatelessWidget {
  const TopCartZone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // width: 50,
      decoration: const BoxDecoration(
        color: ColorPalette.black010035,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
