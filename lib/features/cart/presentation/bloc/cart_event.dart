import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class InitialCartEvent extends CartEvent {
  const InitialCartEvent();
}
