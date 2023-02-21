class MoiveResult {
  int _page = 0;
  int _totalResults = 0;
  int _totalPages = 0;
  List<Movie> _results = [];

  MoiveResult.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'] ?? 0;
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<Movie> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Movie result = Movie(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Movie> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}

class Movie {
  int _voteCount = 0;
  int _id = -1;
  bool _video = false;
  // double _vote_averag = 0.0;
  String _title = "";
  double _popularity = 0.0;
  String _posterPath = "";
  String _originalLanguage = "";
  String _originalTitle = "";
  final List<int> _genreIds = [];
  String _backdropPath = "";
  bool _adult = false;
  String _overview = "";
  String _releaseDate = "";

  Movie(result) {
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
//    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  // double get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}
