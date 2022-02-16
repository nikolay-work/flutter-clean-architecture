import 'package:flutter/material.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/theme/color_palette.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      decoration: const BoxDecoration(
        color: ColorPalette.black010035,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: ColorPalette.black010035,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              CustomIcons.bottomBarExplorer,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(CustomIcons.bottomBarCart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(CustomIcons.bottomBarFavorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(CustomIcons.bottomBarCabinet),
            label: "",
          ),
        ],
      ),
    );
  }
}

// SvgPicture.asset(CustomIcons.bottomBarExplorer),
