import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/utils/constants.dart';
import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';
import 'package:phones_market/features/cart/domain/usecases/case_cart_data.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CaseCartData caseCartData;

  CartBloc({required this.caseCartData}) : super(CartLoadingState()) {
    on<InitialCartEvent>(
            (InitialCartEvent event, Emitter<CartState> emit) async {
          emit(CartLoadingState());

          final Either<Failure, CartEntity> failureOrData =
          await caseCartData();
          emit(failureOrData.fold(
                  (failure) => CartErrorState(message: _mapFailureToMessage(failure)),
                  (data) => CartLoadedState(cartData: data)));
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