import 'package:le_libros/app/domain/models/response.dart';

abstract class TrendingState {
  const TrendingState();
}

class LoadingTrendingState extends TrendingState {
  const LoadingTrendingState();
}

class ErrorTrendingState extends TrendingState {
  const ErrorTrendingState();
}

class LoadedTrendingState extends TrendingState {
  final Response trendies;

  const LoadedTrendingState(this.trendies);
}
