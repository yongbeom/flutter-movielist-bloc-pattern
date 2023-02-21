import 'package:flutter/foundation.dart';

@immutable
abstract class MovieEvent {}

class MovieFetchDataEvent extends MovieEvent {
  MovieFetchDataEvent();
}
