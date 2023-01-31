
import 'package:movies_app/data/models/movies_model.dart';

class TrendingMoviesResponse {
  TrendingMoviesResponse({
    required this.results,
  });
  late final List<MoviesModel> results;

  TrendingMoviesResponse.fromJson(Map<String, dynamic> json){
    results = List.from(json['results']).map((e)=>MoviesModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['results'] = results.map((e)=>e.toJson()).toList();
    return data;
  }
}
