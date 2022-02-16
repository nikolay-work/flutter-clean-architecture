import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

import 'filter_options_item.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 414,
      padding: const EdgeInsets.only(
        left: 46,
        right: 20,
        top: 24,
        bottom: 0,
      ),
      decoration: const BoxDecoration(
        color: ColorPalette.whiteFFFFFF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 37,
                height: 37,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close_outlined,
                    color: ColorPalette.whiteFFFFFF,
                    size: 18,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: ColorPalette.black010035,
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Text(
                'Filter options',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                width: 86,
                height: 37,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Done',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: ColorPalette.whiteFFFFFF),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: ColorPalette.orangeFF6E4E,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const FilterOptionsItem(
            title: 'Brand',
            items: [
              'Samsung',
              'Huawei',
              'Apple',
            ],
          ),
          // TODO Сделать диапазон от 0 до 10000
          const FilterOptionsItem(
            title: 'Price',
            items: [
              '\$0 - \$100',
              '\$101 - \$300',
              '\$301 - \$500',
            ],
          ),
          const FilterOptionsItem(
            title: 'Size',
            items: [
              '4.5 to 5.5 inches',
              '5.5 to 6.5 inches',
            ],
          ),
        ],
      ),
    );
  }
}
