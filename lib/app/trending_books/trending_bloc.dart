import 'package:bloc/bloc.dart';
import 'package:le_libros/app/trending_books/events/trending_event.dart';
import 'package:le_libros/app/trending_books/states/trending_state.dart';
import 'package:le_libros/helpers/http_helper.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final HttpHelper httpHelper;
  TrendingBloc(this.httpHelper) : super(const LoadingTrendingState()) {
    on<LoadTrendingEvent>((event, emit) async {
      emit(const LoadingTrendingState());

      final trendies = await httpHelper.getRecentPublished();
      emit(LoadedTrendingState(trendies));
    });
  }
}
