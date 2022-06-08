import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:phones_market/core/resources/custom_icons.dart';
import 'package:phones_market/features/home/presentation/bloc/home_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/home_event.dart';
import 'package:phones_market/features/home/presentation/widgets/app_bar_dropdown_menu.dart';
import 'package:phones_market/features/home/presentation/widgets/custom_bottom_bar.dart';
import 'package:phones_market/features/home/presentation/widgets/filter_options.dart';
import 'package:phones_market/features/home/presentation/widgets/home_body.dart';

import '../../../../l10n/locale_keys.g.dart';
import '../../../../locator_service.dart';
import '../../../../services/fcm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const InitialHomeEvent());
    sl<FCM>().notificationsStream.stream.listen((event) {
      showSimpleNotification(
        Text(event.title ?? ""),
        subtitle: Text(event.body ?? ""),
        background: Colors.cyan.shade700,
        trailing: Builder(builder: (context) {
          return TextButton(
            onPressed: () {
              OverlaySupportEntry.of(context)?.dismiss();
              Navigator.pushNamed(context, '/cart');
            },
            child: Text(
              LocaleKeys.close.tr(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }),
        duration: const Duration(seconds: 200),
      );
      // sl<FCM>().showAlertDialog(context);
    });
    // WidgetsBinding.instance?.addPostFrameCallback((duration) async {
    //   sl<FCM>().showAlertDialog(context);
    // });
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
