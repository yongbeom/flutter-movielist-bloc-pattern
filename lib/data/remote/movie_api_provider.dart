import 'dart:async';
import 'dart:convert';

import 'package:movielist/data/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieApiProvider {
  final _apiKey = '8fee0b816cb27174e13ebae2eb9c1ec5';

  Future<MoiveResult> fetchMovieList() async {
    var url = Uri.parse('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MoiveResult.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
