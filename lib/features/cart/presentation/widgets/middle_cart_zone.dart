import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';
import 'package:phones_market/theme/color_palette.dart';

class MiddleCartZone extends StatelessWidget {
  final CartEntity data;

  const MiddleCartZone({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemHeight = ((88 + 46) * data.basket.length - 20).toDouble();

    return Container(
      height: itemHeight,
      padding: const EdgeInsets.only(
        left: 33,
        right: 20,
        //bottom: 20,
      ),
      color: ColorPalette.black010035,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  data.basket[index].images,
                  width: 88,
                  height: 88,
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                //flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.basket[index].title,
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          fontSize: 20, color: ColorPalette.whiteFFFFFF),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        NumberFormat.simpleCurrency()
                            .format(data.basket[index].price),
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontSize: 20, color: ColorPalette.orangeFF6E4E),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Container(
                width: 26,
                height: 68,
                decoration: const BoxDecoration(
                  color: ColorPalette.black282843,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 2,
                        child: IconButton(
                          iconSize: 10,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            color: ColorPalette.whiteFFFFFF,
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontSize: 18,
                            color: ColorPalette.whiteFFFFFF,
                            height: 1),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        iconSize: 10,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: ColorPalette.whiteFFFFFF,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(CustomIcons.cartTrash),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 46,
        ),
        itemCount: data.basket.length,
      ),
    );
  }
}
