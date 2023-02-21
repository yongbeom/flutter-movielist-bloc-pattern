import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/movie_repo_imp.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final _movieRepo = MovieRepoImp();

  MovieBloc() : super(MovieInitial()) {
    on<MovieFetchDataEvent>(_fetchMovieList);
  }

  FutureOr<void> _fetchMovieList(MovieEvent event, Emitter<MovieState> emit) async {
    if (event is MovieFetchDataEvent) {
      emit(MoviePageLoading());
      await _movieRepo
          .getMovieData()
          .onError((error, stackTrace) => emit(MoviePageError(error.toString())))
          .then((value) {
        emit(MoviePageLoaded(value));
      });
    }
  }
}
