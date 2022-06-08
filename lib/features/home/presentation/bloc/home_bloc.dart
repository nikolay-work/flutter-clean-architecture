import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/utils/constants.dart';
import 'package:phones_market/features/home/domain/entities/home_entity.dart';
import 'package:phones_market/features/home/domain/usecases/case_home_data.dart';
import 'package:phones_market/features/home/presentation/bloc/home_event.dart';
import 'package:phones_market/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CaseHomeData caseHomeData;

  HomeBloc({required this.caseHomeData}) : super(HomeLoadingState()) {
    on<InitialHomeEvent>(
        (InitialHomeEvent event, Emitter<HomeState> emit) async {
      emit(HomeLoadingState());

      final Either<Failure, HomeEntity> failureOrData =
          await caseHomeData();
      emit(failureOrData.fold(
          (failure) => HomeErrorState(message: _mapFailureToMessage(failure)),
          (data) => HomeLoadedState(homeData: data)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.serverFailureMessage;
      case CacheFailure:
        return Constants.cachedFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
