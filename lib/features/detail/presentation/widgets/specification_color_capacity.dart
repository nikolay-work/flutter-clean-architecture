import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';
import 'package:phones_market/theme/color_palette.dart';

import '../../../../l10n/locale_keys.g.dart';

class SpecificationColorCapacity extends StatefulWidget {
  final DetailEntity data;
  int colorId = 0;
  int capacityId = 0;

  SpecificationColorCapacity({Key? key, required this.data}) : super(key: key);

  @override
  _SpecificationColorCapacityState createState() =>
      _SpecificationColorCapacityState();
}

class _SpecificationColorCapacityState
    extends State<SpecificationColorCapacity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.selectColorAndCapacity.tr(),
          style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView.separated(
                itemCount: widget.data.color.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.colorId = index;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(int.parse(
                                widget.data.color[index].substring(1, 7),
                                radix: 16) +
                            0xFF000000),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: widget.colorId == index
                          ? SvgPicture.asset(
                              CustomIcons.specificationsChooseColor)
                          : const SizedBox(),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 18,
                  );
                },
              ),
              ListView.separated(
                itemCount: widget.data.capacity.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 79,
                    height: 28,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          widget.capacityId = index;
                        });
                      },
                      child: Text(
                        widget.data.capacity[index],
                        style: widget.capacityId == index
                            ? Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: ColorPalette.whiteFFFFFF,
                                )
                            : Theme.of(context).textTheme.bodyText2,
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: widget.capacityId == index
                            ? ColorPalette.orangeFF6E4E
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 18,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
