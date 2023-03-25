import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_booking/network/response/get_movie_trailers_response.dart';

import 'api_constants.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_GET_MOVIE_TRAILER)
abstract class TheMovieApi{
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET("/3/movie/{movie_id}/videos")
Future<GetMovieTrailersResponse> getMovieTrailers(
      @Path("movie_id") String movieId,
      @Query(PARAM_API_KEY) String apiKey,
    );
}