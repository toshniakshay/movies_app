import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/screen_util/screen_util.dart';
import 'package:movies_app/presentation/journey/home/movie_carousal/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final PageController pageController;
  final String posterPath;
  final int movieId;

  const AnimatedMovieCardWidget({
    Key? key,
    required this.pageController,
    required this.posterPath,
    required this.index,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(value) * ScreenUtil.screenHeight *
                  0.5,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Curves.easeIn.transform(
                  index == 0 ? value : value * 0.5) * ScreenUtil.screenHeight *
                  0.5,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
