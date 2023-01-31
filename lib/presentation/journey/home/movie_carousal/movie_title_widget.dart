import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';

class MovieTitleWidget extends StatelessWidget {
  const MovieTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
        builder: (context, state) {
      if (state is MovieBackDropChanged) {
        return Text(
          state.movie.title,
          style: Theme.of(context).textTheme.headline6,
          maxLines: 1,
          overflow: TextOverflow.fade,
        );
      }
      return const SizedBox.shrink();
    });
  }
}
