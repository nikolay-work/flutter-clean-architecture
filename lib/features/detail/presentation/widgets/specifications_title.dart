import 'package:flutter/material.dart';

class SpecificationsTitle extends StatelessWidget {
  const SpecificationsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: Alignment.topLeft,
        child: Text(
          'Galaxy Note 20 Ultra',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}