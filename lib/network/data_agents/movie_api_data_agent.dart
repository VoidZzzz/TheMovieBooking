

import '../response/get_movie_trailers_response.dart';

abstract class MovieApiDataAgent{
  Future<GetMovieTrailersResponse> getMovieTrailers(int movieId);
}