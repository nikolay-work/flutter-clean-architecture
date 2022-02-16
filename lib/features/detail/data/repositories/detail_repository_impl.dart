import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/platform/network_info.dart';
import 'package:phones_market/features/detail/data/datasources/detail_remote_data_source.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';
import 'package:phones_market/features/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DetailRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<DetailEntity>>> getDetailData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDetail = await remoteDataSource.getHomeData();
        return Right(remoteDetail);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
