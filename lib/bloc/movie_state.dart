import 'package:flutter/foundation.dart';

import '../data/model/movie.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MoviePageLoading extends MovieState {}

class MoviePageLoaded extends MovieState {
  late final MoiveResult data;
  MoviePageLoaded(this.data);
}

class MoviePageError extends MovieState {
  late final String errorMessage;
  MoviePageError(this.errorMessage);
}
