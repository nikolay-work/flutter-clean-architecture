import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';
import 'package:phones_market/features/detail/presentation/widgets/specification_color_capacity.dart';
import 'package:phones_market/features/detail/presentation/widgets/specifications_add.dart';
import 'package:phones_market/features/detail/presentation/widgets/specifications_details.dart';
import 'package:phones_market/features/detail/presentation/widgets/specifications_like.dart';
import 'package:phones_market/features/detail/presentation/widgets/specifications_menu.dart';
import 'package:phones_market/features/detail/presentation/widgets/specifications_rating.dart';
import 'package:phones_market/features/detail/presentation/widgets/specifications_title.dart';
import 'package:phones_market/theme/color_palette.dart';

class Specifications extends StatelessWidget {
  final DetailEntity data;

  const Specifications({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 7),
      decoration: const BoxDecoration(
        color: ColorPalette.whiteFFFFFF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 28,
          bottom: 36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpecificationsTitle(),
                      SpecificationsRating(
                        rating: data.rating,
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SpecificationsLike(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const SpecificationsMenu(),
            const SizedBox(
              height: 30,
            ),
            SpecificationsDetails(data: data),
            const SizedBox(
              height: 28,
            ),
            SpecificationColorCapacity(data: data),
            const SizedBox(
              height: 27,
            ),
            SpecificationsAdd(data: data),
          ],
        ),
      ),
    );
  }
}
