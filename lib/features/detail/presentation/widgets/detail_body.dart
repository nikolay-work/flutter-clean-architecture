import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/core/widgets/loading_state.dart';
import 'package:phones_market/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:phones_market/features/detail/presentation/bloc/detail_state.dart';
import 'package:phones_market/features/detail/presentation/widgets/specifications.dart';

import 'carousel_of_goods.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
        builder: (BuildContext context, state) {
      if (state is DetailLoadedState) {
        // print (state.detailData[0].images);
        // state.detailData[0].images;
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CarouselOfGoods(
                imgList: state.detailData.images,
              ),
              Specifications(data: state.detailData,),
            ],
          ),
        );
      } else if (state is DetailErrorState) {
        // TODO разработать виджет ошибки
        return Container();
      } else {
        return const LoadingState();
      }
      //return HotSales();
    });
  }
}
