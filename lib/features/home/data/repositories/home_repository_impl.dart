import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/platform/network_info.dart';
import 'package:phones_market/features/home/data/datasources/home_local_data_source.dart';
import 'package:phones_market/features/home/data/datasources/home_remote_data_source.dart';
import 'package:phones_market/features/home/domain/entities/home_entity.dart';
import 'package:phones_market/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<HomeEntity>>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHome = await remoteDataSource.getHomeData();
        localDataSource.addHomeDataToCache(remoteHome);
        return Right(remoteHome);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationHome = await localDataSource.getHomeDataFromCache();
        return Right(locationHome);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
