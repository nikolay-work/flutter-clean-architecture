import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/category_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/home_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/home_state.dart';
import 'package:phones_market/features/home/presentation/widgets/search_form.dart';

import '../../../../l10n/locale_keys.g.dart';
import 'best_seller_grid.dart';
import 'category_header.dart';
import 'category_menu.dart';
import 'hot_sales_loading.dart';
import 'hot_sales_slider.dart';

class HomeBody extends StatelessWidget {
  HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryHeader(
            categoryName: LocaleKeys.selectCategory.tr(),
            buttonText: LocaleKeys.viewAll.tr(),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CategoryBloc, int>(
              builder: (BuildContext context, state) {
            return CategoryMenu(activeButtonId: state);
          }),
          const SearchForm(),
          CategoryHeader(
            categoryName: LocaleKeys.hotSales.tr(),
            buttonText: LocaleKeys.seeMore.tr(),
          ),
          BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, state) {
            if (state is HomeLoadedState) {
              // print (state.homeData);
              return HotSalesSlider(
                homeStoreData: state.homeData.homeStore,
              );
            } else if (state is HomeErrorState) {
              // TODO разработать виджет ошибки
              return const HotSalesLoading();
            } else {
              return const HotSalesLoading();
            }
            //return HotSales();
          }),
          CategoryHeader(
            categoryName: LocaleKeys.bestSeller.tr(),
            buttonText: LocaleKeys.seeMore.tr(),
          ),
          BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, state) {
            if (state is HomeLoadedState) {
              // print (state.homeData);
              return BestSellerGrid(
                bestSellerData: state.homeData.bestSeller,
              );
            } else if (state is HomeErrorState) {
              // TODO разработать виджет ошибки
              return const HotSalesLoading();
            } else {
              return const HotSalesLoading();
            }
            //return HotSales();
          }),
        ],
      ),
    );
  }
}
