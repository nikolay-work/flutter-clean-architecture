import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:phones_market/locator_service.dart' as di;
import 'package:phones_market/services/fcm.dart';
import 'package:phones_market/theme/theme_manager.dart';
import 'package:uni_links/uni_links.dart';

import 'core/navigator/navigation_service.dart';
import 'core/navigator/route_generator.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/detail/presentation/bloc/detail_bloc.dart';
import 'features/home/presentation/bloc/category_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'l10n/l10n.dart';
import 'locator_service.dart';

// MyHttpOverrides should be used while in development mode,
// do NOT do this when you want to release to production
// для решения проблемы CERTIFICATE_VERIFY_FAILED при загрузке
// TODO удалить из продакшена
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// bool _initialURILinkHandled = false;

void main() async {
  // MyHttpOverrides should be used while in development mode,
  // do NOT do this when you want to release to production
  // для решения проблемы CERTIFICATE_VERIFY_FAILED при загрузке
  // TODO удалить из продакшена
  HttpOverrides.global = MyHttpOverrides();
  // -------------
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await di.init();
  await EasyLocalization.ensureInitialized();
  String initialRoute = await initURIHandler();
  sl<FCM>().setNotifications();

  runApp(EasyLocalization(
    path: 'assets/l10n',
    supportedLocales: L10n.all,
    fallbackLocale: L10n.all[0],
    child: MyApp(
      initialRoute: initialRoute,
    ),
  ));
}


class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _streamSubscription;

  void _incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        debugPrint('Received URI: $uri');
        String _currentPath;
        switch (uri?.path) {
          case '/cart':
            _currentPath = '/cart';
            break;
          case '/detail':
            _currentPath = '/detail';
            break;
          default:
            _currentPath = '/';
        }
        debugPrint('999999999: $_currentPath');
        sl<NavigationService>().navigateTo(_currentPath);
        // 3
      }, onError: (Object err) {
        debugPrint('Error occurred: $err');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _initURIHandler();
    _incomingLinkHandler();
    debugPrint("${window.locale}");
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("777777: ${widget.initialRoute}");
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => sl<CategoryBloc>()),
        BlocProvider<DetailBloc>(create: (context) => sl<DetailBloc>()),
        BlocProvider<CartBloc>(create: (context) => sl<CartBloc>()),
      ],
      child: OverlaySupport(
        child: MaterialApp(
          localizationsDelegates:context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: sl<NavigationService>().navigatorKey,
          theme: ThemeManager(locale: context.locale.toString()).getTheme,
          initialRoute: widget.initialRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}

Future<String> initURIHandler() async {
  String initialRoute = '/';
  try {
    // 3
    final initialURI = await getInitialUri();
    // 4
    if (initialURI != null) {
      debugPrint("Initial URI received $initialURI");
      switch (initialURI.path) {
        case '/cart':
          initialRoute = '/cart';
          break;
        case '/detail':
          initialRoute = '/detail';
          break;
        default:
          initialRoute = '/';
      }
      debugPrint("22222222222");
      debugPrint("_currentPath: $initialRoute");
    }
  } on PlatformException {
    debugPrint("Failed to receive initial uri");
  } on FormatException catch (err) {
    debugPrint('Malformed Initial URI received');
  }
  return initialRoute;
}
