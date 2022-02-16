import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';

abstract class DetailRepository {
  Future<Either<Failure, List<DetailEntity>>>getDetailData();
}