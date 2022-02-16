import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

class CarouselOfGoods extends StatelessWidget {
  final List<String> imgList;

  const CarouselOfGoods({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 335,
        enlargeCenterPage: true,
      ),
      items: imgList
          .map(
            (item) => Container(
              decoration: BoxDecoration(
                color: ColorPalette.whiteFFFFFF,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

// final List<Widget> imageSliders = imgList
//     .map(
//       (item) => Container(
//         //height: 335,
//
//         decoration: BoxDecoration(
//           color: ColorPalette.whiteFFFFFF,
//           borderRadius: const BorderRadius.all(
//             Radius.circular(20.0),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               blurRadius: 10,
//             ),
//           ],
//         ),
//         padding: EdgeInsets.all(5.0),
//         margin: EdgeInsets.all(5.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//           child: Image.network(
//             item,
//             fit: BoxFit.cover,
//             width: 1000,
//           ),
//         ),
//       ),
//     )
//     .toList();
