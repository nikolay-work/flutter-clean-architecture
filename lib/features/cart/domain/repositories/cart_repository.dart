import 'package:dartz/dartz.dart';
import 'package:phones_market/core/error/failure.dart';
import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>>getCartData();
}