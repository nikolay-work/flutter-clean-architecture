import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> getHomeData();
}