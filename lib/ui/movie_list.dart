import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/bloc/movie_bloc.dart';

import 'movie_list_screen.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Center(
        child: BlocProvider<MovieBloc>.value(
          value: MovieBloc(),
          child: const MovieListScreen(),
        ),
      ),
    );
  }
}
