import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

class HotSalesLoading extends StatelessWidget {
  const HotSalesLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        color: ColorPalette.black010035,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
