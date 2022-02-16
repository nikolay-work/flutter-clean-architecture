import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';

class SpecificationsDetails extends StatelessWidget {
  final DetailEntity data;

  const SpecificationsDetails({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SvgPicture.asset(CustomIcons.specificationsCpu),
              const SizedBox(
                height: 8,
              ),
              Text(
                data.cpu,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SvgPicture.asset(CustomIcons.specificationsCamera),
              const SizedBox(
                height: 8,
              ),
              Text(
                data.camera,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SvgPicture.asset(CustomIcons.specificationsSsd),
              const SizedBox(
                height: 8,
              ),
              Text(
                data.ssd,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SvgPicture.asset(CustomIcons.specificationsSd),
              const SizedBox(
                height: 8,
              ),
              Text(
                data.sd,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
