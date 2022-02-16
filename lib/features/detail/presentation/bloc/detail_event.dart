import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class InitialDetailEvent extends DetailEvent {
  const InitialDetailEvent();
}
