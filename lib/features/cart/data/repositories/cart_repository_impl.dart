import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/platform/network_info.dart';
import 'package:phones_market/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';
import 'package:phones_market/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CartEntity>> getCartData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDetail = await remoteDataSource.getCartData();
        return Right(remoteDetail);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
