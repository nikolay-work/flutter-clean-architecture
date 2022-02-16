import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/theme/color_palette.dart';

class FavoriteButton extends StatefulWidget {
  final List bestSellerData;
  final int id;

  const FavoriteButton({
    Key? key,
    required this.bestSellerData,
    required this.id,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 25,
        height: 25,
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: ColorPalette.whiteFFFFFF,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: ColorPalette.greyB3B3C3,
            )
          ],
        ),
        child: widget.bestSellerData[widget.id].isFavorites
            ? SvgPicture.asset(
          CustomIcons.favoriteTrue,
        )
            : SvgPicture.asset(
          CustomIcons.favoriteFalse,
        ),
      ),
    );
  }
}
