import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/features/home/presentation/bloc/home_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/home_event.dart';
import 'package:phones_market/features/home/presentation/widgets/app_bar_dropdown_menu.dart';
import 'package:phones_market/features/home/presentation/widgets/custom_bottom_bar.dart';
import 'package:phones_market/features/home/presentation/widgets/filter_options.dart';
import 'package:phones_market/features/home/presentation/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const InitialHomeEvent());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return const FilterOptions();
                },
              ),
            },
            icon: SvgPicture.asset(CustomIcons.filterAppBar),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(CustomIcons.locationAppBar),
            const SizedBox(
              width: 10,
            ),
            AppBarDropdownMenu(),
          ],
        ),
        centerTitle: true,
      ),
      body: HomeBody(),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
