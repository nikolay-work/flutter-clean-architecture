import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/usecases/usecase.dart';
import 'package:phones_market/features/home/domain/entities/home_entity.dart';
import 'package:phones_market/features/home/domain/repositories/home_repository.dart';

class CaseHomeData extends UseCase<List<HomeEntity>> {
  final HomeRepository homeRepository;

  CaseHomeData({required this.homeRepository});

  @override
  Future<Either<Failure, List<HomeEntity>>> call() {
    return homeRepository.getHomeData();
  }
}