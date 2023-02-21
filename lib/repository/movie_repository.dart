import '../data/model/movie.dart';
import '../data/remote/movie_api_provider.dart';

class MoiveRepository {
  final moviesApiProvider = MovieApiProvider();

  Future<MoiveResult> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
