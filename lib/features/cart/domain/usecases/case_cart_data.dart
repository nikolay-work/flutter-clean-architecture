import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/core/usecases/usecase.dart';
import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';
import 'package:phones_market/features/cart/domain/repositories/cart_repository.dart';

class CaseCartData extends UseCase<CartEntity> {

  final CartRepository cartRepository;

  CaseCartData({required this.cartRepository});

  @override
  Future<Either<Failure, CartEntity>> call() {
    return cartRepository.getCartData();
  }
  
}