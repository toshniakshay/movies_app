import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/journey/home/movie_carousal/movie_backdrop_widget.dart';
import 'package:movies_app/presentation/journey/home/movie_carousal/movie_title_widget.dart';
import 'package:movies_app/presentation/widgets/separator.dart';

import '../../../widgets/movie_app_bar.dart';
import 'movie_page_view.dart';

class MovieCarousalWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarousalWidget({
    Key? key,
    required this.movies,
    required this.defaultIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackDropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageViewWidget(
              movies: movies,
              initialPage: defaultIndex,
            ),
            const MovieTitleWidget(),
            const Separator(),
          ],
        ),
      ],
    );
  }
}
