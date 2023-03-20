import 'package:dio/dio.dart';
import 'package:the_movie_booking/authentication/network/api_constants.dart';
import 'package:the_movie_booking/authentication/network/the_movie_api.dart';

import '../response/get_movie_trailers_response.dart';
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