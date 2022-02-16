import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:phones_market/core/platform/network_info.dart';
import 'package:phones_market/features/home/data/datasources/home_local_data_source.dart';
import 'package:phones_market/features/home/data/datasources/home_remote_data_source.dart';
import 'package:phones_market/features/home/data/repositories/home_repository_impl.dart';
import 'package:phones_market/features/home/domain/repositories/home_repository.dart';
import 'package:phones_market/features/home/domain/usecases/case_home_data.dart';
import 'package:phones_market/features/home/presentation/bloc/category_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/cart/data/datasources/cart_remote_data_source.dart';
import 'features/cart/data/repositories/cart_repository_impl.dart';
import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/cart/domain/usecases/case_cart_data.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/detail/data/datasources/detail_remote_data_source.dart';
import 'features/detail/data/repositories/detail_repository_impl.dart';
import 'features/detail/domain/repositories/detail_repository.dart';
import 'features/detail/domain/usecases/case_detail_data.dart';
import 'features/detail/presentation/bloc/detail_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => HomeBloc(caseHomeData: sl()),
  );
  sl.registerFactory(() => CategoryBloc());
  sl.registerFactory(
    () => DetailBloc(caseDetailData: sl()),
  );
  sl.registerFactory(
        () => CartBloc(caseCartData: sl()),
  );

  // UseCases
  sl.registerLazySingleton(
    () => CaseHomeData(homeRepository: sl()),
  );
  sl.registerLazySingleton(
    () => CaseDetailData(detailRepository: sl()),
  );
  sl.registerLazySingleton(
        () => CaseCartData(cartRepository: sl()),
  );

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<DetailRepository>(
    () => DetailRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<DetailRemoteDataSource>(
    () => DetailRemoteDataSource(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<CartRemoteDataSource>(
        () => CartRemoteDataSource(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
