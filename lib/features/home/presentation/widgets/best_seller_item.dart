import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

import 'favorite_button.dart';

class BestSellerItem extends StatelessWidget {
  final List bestSellerData;
  final int id;

  const BestSellerItem({
    Key? key,
    required this.bestSellerData,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: id);
      },
      child: Container(
        width: 181,
        height: 527,
        padding: const EdgeInsets.only(
          bottom: 15,
          top: 12,
          right: 12,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          color: ColorPalette.whiteFFFFFF,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      bestSellerData[id].picture,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FavoriteButton(bestSellerData: bestSellerData, id: id),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          bestSellerData[id].discountPrice.toString(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          bestSellerData[id].priceWithoutDiscount.toString(),
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                color: ColorPalette.greyCCCCC,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                      ],
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topLeft,
                      child: Text(
                        bestSellerData[id].title,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
