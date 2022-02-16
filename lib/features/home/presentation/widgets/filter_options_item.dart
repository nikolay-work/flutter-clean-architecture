import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';

class FilterOptionsItem extends StatelessWidget {
  final String title;
  final List items;

  const FilterOptionsItem({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 37,
          child: DropdownButtonFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(),
              ),
              icon: SvgPicture.asset(CustomIcons.expandMoreAppBar),
              value: 0,
              elevation: 0,
              items: items
                  .asMap()
                  .entries
                  .map(
                    (item) => DropdownMenuItem(
                        child: Text(
                          item.value,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        value: item.key),
                  )
                  .toList(),
              onChanged: (value) {}),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
