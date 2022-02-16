import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/utils/constants.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';
import 'package:phones_market/features/detail/domain/usecases/case_detail_data.dart';

import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final CaseDetailData caseDetailData;

  DetailBloc({required this.caseDetailData}) : super(DetailLoadingState()) {
    on<InitialDetailEvent>(
        (InitialDetailEvent event, Emitter<DetailState> emit) async {
      emit(DetailLoadingState());

      final Either<Failure, List<DetailEntity>> failureOrData =
          await caseDetailData();
      emit(failureOrData.fold(
          (failure) => DetailErrorState(message: _mapFailureToMessage(failure)),
          (data) => DetailLoadedState(detailData: data)));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.serverFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
