import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/category_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/home_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/home_state.dart';
import 'package:phones_market/features/home/presentation/widgets/search_form.dart';

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
          const CategoryHeader(
            categoryName: 'Select Category',
            buttonText: 'view all',
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CategoryBloc, int>(
              builder: (BuildContext context, state) {
            return CategoryMenu(activeButtonId: state);
          }),
          const SearchForm(),
          const CategoryHeader(
            categoryName: 'Hot sales',
            buttonText: 'see more',
          ),
          BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, state) {
            if (state is HomeLoadedState) {
              // print (state.homeData);
              return HotSalesSlider(
                homeStoreData: state.homeData[0].homeStore,
              );
            } else if (state is HomeErrorState) {
              // TODO разработать виджет ошибки
              return Container();
            } else {
              return const HotSalesLoading();
            }
            //return HotSales();
          }),
          const CategoryHeader(
            categoryName: 'Best Seller',
            buttonText: 'see more',
          ),
          BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, state) {
            if (state is HomeLoadedState) {
              // print (state.homeData);
              return BestSellerGrid(
                bestSellerData: state.homeData[0].bestSeller,
              );
            } else if (state is HomeErrorState) {
              // TODO разработать виджет ошибки
              return Container();
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
