import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/core/widgets/loading_state.dart';
import 'package:phones_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:phones_market/features/cart/presentation/bloc/cart_state.dart';
import 'package:phones_market/features/cart/presentation/widgets/title_cart_page.dart';
import 'package:phones_market/features/cart/presentation/widgets/top_cart_zone.dart';

import 'bottom_cart_zone.dart';
import 'middle_cart_zone.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, state) {
      if (state is CartLoadedState) {
        // print (state.detailData[0].images);
        // state.detailData[0].images;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleCartPage(),
              const TopCartZone(),
              MiddleCartZone(
                data: state.cartData,
              ),
              BottomCartZone(
                data: state.cartData,
              ),
            ],
          ),
        );
      } else if (state is CartErrorState) {
        // TODO разработать виджет ошибки
        return Container();
      } else {
        return const LoadingState();
      }
      //return HotSales();
    });

    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     const TitleCartPage(),
    //     const TopCartZone(),
    //     MiddleCartZone(),
    //     BottomCartZone(),
    //   ],
    // );
  }
}
