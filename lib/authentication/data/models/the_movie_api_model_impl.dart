import 'package:the_movie_booking/authentication/data/models/the_movie_api_model.dart';
import 'package:the_movie_booking/authentication/network/data_agents/movie_api_data_agent.dart';
import 'package:the_movie_booking/authentication/network/data_agents/movie_api_data_agent_impl.dart';
import 'package:the_movie_booking/authentication/network/response/get_movie_trailers_response.dart';

class TheMovieApiModelImpl extends TheMovieApiModel{
  static final TheMovieApiModelImpl _singleton = TheMovieApiModelImpl._internal();

  factory TheMovieApiModelImpl(){
    return _singleton;
  }

  TheMovieApiModelImpl._internal();

  final MovieApiDataAgent _mdataAgent =MovieApiDataAgentImpl();

  @override
  Future<GetMovieTrailersResponse> getMovieTrailers(int movieId) {
    return _mdataAgent.getMovieTrailers(movieId);
  }


}