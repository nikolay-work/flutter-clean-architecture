import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/core/widgets/app_bar_action.dart';
import 'package:phones_market/core/widgets/app_bar_back_arrow.dart';
import 'package:phones_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:phones_market/features/cart/presentation/bloc/cart_event.dart';
import 'package:phones_market/features/cart/presentation/widgets/cart_body.dart';
import 'package:phones_market/theme/color_palette.dart';

class CartPage extends StatelessWidget {
  String id = '';

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(const InitialCartEvent());
    Object? settingsId = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackArrow(),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add address',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 15),
              ),
              const SizedBox(
                width: 9,
              ),
              AppBarAction(
                iconWidget: SvgPicture.asset(
                  CustomIcons.locationAppBar,
                  color: ColorPalette.whiteFFFFFF,
                ),
              ),
            ],
          ),
        ],
      ),
      body: const CartBody(),
    );
  }
}
