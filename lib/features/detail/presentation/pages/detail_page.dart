import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/core/widgets/app_bar_action.dart';
import 'package:phones_market/core/widgets/app_bar_back_arrow.dart';
import 'package:phones_market/features/detail/presentation/widgets/detail_body.dart';
import 'package:phones_market/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:phones_market/features/detail/presentation/bloc/detail_event.dart';

class DetailPage extends StatelessWidget {
  int? id;

  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailBloc>(context).add(const InitialDetailEvent());
    Object? settingsId = ModalRoute.of(context)?.settings.arguments;
    if (settingsId != null) {
      id = settingsId as int;
    } else {
      id = 0;
    }

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackArrow(),
        actions: [
          AppBarAction(
            iconWidget: SvgPicture.asset(CustomIcons.bottomBarCart),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Product Details',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: const DetailBody(),
    );
  }
}


