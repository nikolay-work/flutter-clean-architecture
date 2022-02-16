import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/features/home/presentation/bloc/category_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/category_event.dart';
import 'package:phones_market/theme/color_palette.dart';

class CategoryButton extends StatelessWidget {
  final int activeButtonId;
  final bool isActive;
  final String buttonIcon;
  final String buttonName;

  const CategoryButton({
    Key? key,
    required this.activeButtonId,
    required this.isActive,
    required this.buttonIcon,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: CircleAvatar(
                child: SvgPicture.asset(
                  buttonIcon,
                  color: isActive
                      ? ColorPalette.whiteFFFFFF
                      : ColorPalette.greyB3B3C3,
                ),
                radius: 35,
                backgroundColor: isActive
                    ? ColorPalette.orangeFF6E4E
                    : ColorPalette.whiteFFFFFF,
              ),
            ),
            Text(
              buttonName,
              style: isActive
                  ? Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: ColorPalette.orangeFF6E4E)
                  : Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      onTap: () => {
        BlocProvider.of<CategoryBloc>(context)
          ..add(ChooseCategoryEvent(category: activeButtonId)),
      },
    );
  }
}
