import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class ChooseCategoryEvent extends CategoryEvent {
  final int category;

  const ChooseCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}