import 'package:flutter/material.dart';

class TitleCartPage extends StatelessWidget {
  const TitleCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 42,
        top: 50,
        bottom: 49,
      ),
      child: Text(
        'My Cart',
        style:
        Theme.of(context).textTheme.headline1?.copyWith(fontSize: 35),
      ),
    );
  }
}