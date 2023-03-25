import 'package:dio/dio.dart';

import '../api_constants.dart';
import '../response/get_movie_trailers_response.dart';
import '../the_movie_api.dart';
import 'movie_api_data_agent.dart';

class MovieApiDataAgentImpl extends MovieApiDataAgent{
  late TheMovieApi tmApi;

  static MovieApiDataAgentImpl _singleton = MovieApiDataAgentImpl._internal();

  factory MovieApiDataAgentImpl(){
    return _singleton;
  }

  MovieApiDataAgentImpl._internal() {
     final dio = Dio();
      tmApi = TheMovieApi(dio);
  }

  @override
  Future<GetMovieTrailersResponse> getMovieTrailers(int movieId) {
    return tmApi.getMovieTrailers(movieId.toString(), API_KEY);
  }

}