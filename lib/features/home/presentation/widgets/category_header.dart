import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String categoryName;
  final String buttonText;

  const CategoryHeader({
    Key? key,
    required this.categoryName,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryName,
            style: Theme.of(context).textTheme.headline1,
          ),
          TextButton(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.headline5,
            ),
            onPressed: () => {},
          ),

        ],
      ),
    );
  }
}
