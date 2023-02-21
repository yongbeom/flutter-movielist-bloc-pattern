import '../data/model/movie.dart';
import '../data/remote/movie_api_provider.dart';
import 'movie_repo.dart';

class MovieRepoImp extends MovieRepo {
  final moviesApiProvider = MovieApiProvider();

  @override
  Future getMovieData() async {
    try {
      MoiveResult response = await moviesApiProvider.fetchMovieList();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
