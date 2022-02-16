import 'package:flutter/material.dart';

import 'best_seller_item.dart';

class BestSellerGrid extends StatelessWidget {
  final List bestSellerData;

  const BestSellerGrid({
    Key? key,
    required this.bestSellerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 18,
        right: 18,
        bottom: 10,
      ),
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) => BestSellerItem(
          bestSellerData: bestSellerData,
          id: index,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 14),
        //padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemCount: bestSellerData.length,
        physics: ScrollPhysics(),
      ),
    );
  }
}
