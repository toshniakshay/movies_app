import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/screen_util/screen_util.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/journey/home/movie_carousal/animated_movie_card_widget.dart';

class MoviePageViewWidget extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageViewWidget({
    Key? key,
    required this.movies,
    required this.initialPage,
  }) : super(key: key);

  @override
  State<MoviePageViewWidget> createState() => _MoviePageViewWidgetState();
}

class _MoviePageViewWidgetState extends State<MoviePageViewWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            movieId: movie.id,
            posterPath: movie.posterPath,
            pageController: _pageController,
            index: index,
          );
        },
        controller: _pageController,
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropChangedEvent(movie: widget.movies[index]));
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
