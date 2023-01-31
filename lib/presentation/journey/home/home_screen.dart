import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/bloc/movie_carousal/movie_carousal_bloc.dart';

import 'movie_carousal/movie_carousal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarousalBloc bloc;
  late MovieBackdropBloc backdropBloc;

  @override
  void initState() {
    super.initState();

    bloc = getItInstance<MovieCarousalBloc>()
      ..add(const CarousalLoadEvent(defaultIndex: 0));
    backdropBloc = bloc.backdropBloc;
  }

  List<BlocProvider> getProviders() => [
        BlocProvider<MovieCarousalBloc>(
          create: (context) => bloc,
        ),
        BlocProvider<MovieBackdropBloc>(
          create: (context) => backdropBloc,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getProviders(),
      child: BlocConsumer<MovieCarousalBloc, MovieCarousalState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieCarousalLoadedState) {
            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarousalWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: Placeholder(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
