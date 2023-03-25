import '../../network/response/get_movie_trailers_response.dart';

abstract class TheMovieApiModel{
  Future<GetMovieTrailersResponse> getMovieTrailers(int movieId);
}