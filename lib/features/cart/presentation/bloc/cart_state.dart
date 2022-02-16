import 'package:equatable/equatable.dart';
import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartEntity> cartData;

  const CartLoadedState({required this.cartData});

  @override
  List<Object> get props => [cartData];
}

class CartErrorState extends CartState {
  final String message;

  const CartErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
