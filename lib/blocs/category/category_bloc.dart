import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_event.dart';
import 'category_state.dart';
import '../../core/services/api_service.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiService apiService;

  CategoryBloc(this.apiService) : super(CategoryInitial()) {
    // Register event handler here 👇
    on<FetchCategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await apiService.fetchCategories();
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError('Failed to fetch categories'));
      }
    });
  }
}
