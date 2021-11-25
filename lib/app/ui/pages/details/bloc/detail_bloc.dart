import 'package:bloc/bloc.dart';
import 'package:le_libros/app/ui/pages/details/bloc/events/detail_event.dart';
import 'package:le_libros/app/ui/pages/details/bloc/states/detail_state.dart';
import 'package:le_libros/categories/events/category_event.dart';
import 'package:le_libros/helpers/http_helper.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final HttpHelper httpHelper;
  DetailBloc(this.httpHelper) : super(LoadingDetailState()) {
    on<LoadDetailsEvent>((event, emit) async {
      emit(const LoadingDetailState());

      final details = await httpHelper.getBookDetails();
      emit(LoadedDetailState(details: details));
    });
  }
}