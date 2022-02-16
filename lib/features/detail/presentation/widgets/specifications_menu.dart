import 'package:flutter/material.dart';
import 'package:phones_market/theme/color_palette.dart';

class SpecificationsMenu extends StatelessWidget {
  const SpecificationsMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                'Shop',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 20,
                ),
              ),
              const Divider(
                color: ColorPalette.orangeFF6E4E,
                thickness: 3,
                height: 8,
                indent: 4,
                endIndent: 4,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Details',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5?.copyWith(
              fontSize: 20,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Features',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5?.copyWith(
              fontSize: 20,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}