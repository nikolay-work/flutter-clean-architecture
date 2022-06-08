import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

class SpecificationsRating extends StatelessWidget {
  final double rating;

  const SpecificationsRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return index < rating
                ? const Icon(
                    Icons.star,
                    color: ColorPalette.yellowFFB800,
                  )
                : const Icon(
                    Icons.star_border,
                    color: ColorPalette.yellowFFB800,
                  );
          }),
    );
  }
}
