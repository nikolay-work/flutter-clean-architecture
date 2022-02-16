import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_market/features/home/presentation/bloc/category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, int> {
  CategoryBloc() : super(0) {
    on<ChooseCategoryEvent>(
        (ChooseCategoryEvent event, Emitter<int> emit) async {
      emit(event.category);
    });
  }
}
