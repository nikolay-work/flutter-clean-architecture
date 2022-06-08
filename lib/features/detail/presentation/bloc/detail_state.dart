import 'package:equatable/equatable.dart';
import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final DetailEntity detailData;

  const DetailLoadedState({required this.detailData});

  @override
  List<Object> get props => [detailData];
}

class DetailErrorState extends DetailState {
  final String message;

  const DetailErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
