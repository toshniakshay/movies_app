import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/screen_util/screen_util.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';

class MovieBackDropWidget extends StatelessWidget {
  const MovieBackDropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(Sizes.dimen_40.w)),
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                  builder: (ctx, state) {
                    if (state is MovieBackDropChanged) {
                      return CachedNetworkImage(
                        imageUrl: '${ApiConstants.baseImageUrl}${state.movie.backdropPath}',
                        fit: BoxFit.fitHeight,
                      );
                    }
                    return SizedBox.shrink();
                  }),
            ),
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              width: ScreenUtil.screenWidth,
              height: 1,
              color: Colors.transparent,
            ),)
          ] ,
        ),
      ),
    );
  }
}
