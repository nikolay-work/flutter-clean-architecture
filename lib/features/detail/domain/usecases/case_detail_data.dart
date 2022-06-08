import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/usecases/usecase.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';
import 'package:phones_market/features/detail/domain/repositories/detail_repository.dart';

class CaseDetailData extends UseCase<DetailEntity> {
  final DetailRepository detailRepository;

  CaseDetailData({required this.detailRepository});

  @override
  Future<Either<Failure, DetailEntity>> call() {
    return detailRepository.getDetailData();
  }
}