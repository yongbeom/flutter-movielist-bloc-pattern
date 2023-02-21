import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/data/model/movie.dart';

import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

class MovieListScreen extends StatefulWidget {
  static const String id = "movie_list_screen";

  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late MovieBloc _movieBloc;
  List<Movie> _results = [];

  @override
  void initState() {
    _movieBloc = BlocProvider.of(context);
    _movieBloc.add(MovieFetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieInitial) {
          return showLoadingProgress();
        } else if (state is MoviePageLoading) {
          return showLoadingProgress();
        } else if (state is MoviePageLoaded) {
          _results = state.data.results;
        } else if (state is MoviePageError) {
          return Text(state.toString());
        }
        return buildList();
      },
      listener: (context, state) {},
    );
  }

  Widget buildList() {
    return GridView.builder(
        itemCount: _results.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${_results[index].posterPath}',
            fit: BoxFit.cover,
          );
        });
  }

  Widget showLoadingProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
