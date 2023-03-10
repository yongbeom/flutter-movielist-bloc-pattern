import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:movielist/data/model/movie.dart';
import 'package:http/http.dart' as http;

import 'app_exception.dart';

class MovieApiProvider {
  final _apiKey = '8fee0b816cb27174e13ebae2eb9c1ec5';

  Future<MoiveResult> fetchMovieList() async {
    MoiveResult responseJson;
    try {
      var uri = Uri.parse('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');
      final response = await http.get(uri);
      responseJson = returnResponse(response);
    } catch (e) {
      if (e is AppException) {
        throw FetchDataException(e.toString());
      } else if (e is SocketException) {
        throw FetchDataException("Socket Exception: ${e.toString()}");
      } else {
        throw FetchDataException("Something went wrong: ${e.toString()}");
      }
    }
    return responseJson;
  }

  MoiveResult returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return MoiveResult.fromJson(json.decode(response.body));
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}
