import 'package:flutter/material.dart';
import 'package:phones_market/features/home/presentation/widgets/hot_sales_item.dart';

class HotSalesSlider extends StatelessWidget {
  final List homeStoreData;

  const HotSalesSlider({
    Key? key,
    required this.homeStoreData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(homeStoreData);
    return Container(
      height: 182,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: PageView.builder(
        itemBuilder: (context, index) => HotSalesItem(
          homeStoreData: homeStoreData,
          id: index,
        ),
        itemCount: homeStoreData.length,
      ),
    );
  }
}
