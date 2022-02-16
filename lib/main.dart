import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:phones_market/locator_service.dart' as di;
import 'package:phones_market/theme/theme_manager.dart';

import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/cart/presentation/pages/cart_page.dart';
import 'features/detail/presentation/bloc/detail_bloc.dart';
import 'features/detail/presentation/pages/detail_page.dart';
import 'features/home/presentation/bloc/category_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'locator_service.dart';


// MyHttpOverrides should be used while in development mode,
// do NOT do this when you want to release to production
// для решения проблемы CERTIFICATE_VERIFY_FAILED при загрузке
// TODO удалить из продакшена
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  // MyHttpOverrides should be used while in development mode,
  // do NOT do this when you want to release to production
  // для решения проблемы CERTIFICATE_VERIFY_FAILED при загрузке
  // TODO удалить из продакшена
  HttpOverrides.global = MyHttpOverrides();
  // -------------
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => sl<CategoryBloc>()),
        BlocProvider<DetailBloc>(create: (context) => sl<DetailBloc>()),
        BlocProvider<CartBloc>(create: (context) => sl<CartBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeManager.lightTheme,
        home: const HomePage(),
        // initialRoute: '/cart',
        routes: {
          '/detail' : (context) => DetailPage(),
          '/cart' : (context) => CartPage(),
        },
      ),
    );
  }
}
