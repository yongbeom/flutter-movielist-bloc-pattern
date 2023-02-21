import 'package:movielist/data/model/movie.dart';

import 'package:rxdart/rxdart.dart';
import '../repository/movie_repository.dart';

class MoviesBloc {
  final _repository = MoiveRepository();
  final _moviesFetcher = PublishSubject<MoiveResult>();

  Stream<MoiveResult> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MoiveResult itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
