import 'package:the_movie_booking/authentication/network/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:the_movie_booking/authentication/network/response/get_banners_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_cinema_and_show_time_by_date_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_cinema_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_cities_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_config_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_movie_details_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_movies_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_otp_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_payment_types_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_seating_plan_by_showtime_response.dart';
import 'package:the_movie_booking/authentication/network/response/logout_response.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class TheMovieBookingApi {
  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @POST(ENDPOINT_GET_OTP)
  Future<GetOTPResponse> getOTP(
    @Field('phone') String phone,
  );

  @POST(ENDPOINT_GET_SIGN_IN_WITH_PHONE)
  Future<SignInWithPhoneResponse> signInWithPhone(
    @Field('phone') String phone,
    @Field('otp') String otp,
  );

  @GET(ENDPOINT_GET_CITIES)
  Future<GetCitiesResponse> getCities();

  @GET(ENDPOINT_GET_BANNERS)
  Future<GetBannersResponse> getBanners();

  @GET(ENDPOINT_GET_MOVIES)
  Future<GetMoviesResponse> getNowShowingMovies(
    @Query(PARAM_STATUS) String status,
  );

  @GET(ENDPOINT_GET_MOVIES)
  Future<GetMoviesResponse> getComingSoonMovies(
      @Query(PARAM_STATUS) String status,
      );

  @GET("$ENDPOINT_GET_MOVIE_DETAILS/{movie_id}")
  Future<GetMovieDetailsResponse> getMovieDetails(
      @Path(PATH_MOVIE_ID) String movieId,
      );

  @GET(ENDPOINT_GET_CINEMA_AND_SHOW_TIME_BY_DATE)
  Future<GetCinemaAndShowTimeByDateResponse> getCinemaAndShowTimeByDate(
      @Header(HEADER_KEY_AUTORIZATION) String token,
      @Query(PARAM_DATE) String date,
      );

  @GET(ENDPOINT_GET_CONFIGURATIONS)
  Future<GetConfigResponse> getConfigurations();

  @POST(ENDPOINT_LOGOUT)
  Future<LogoutResponse> userLogOut(
      @Header(HEADER_KEY_AUTORIZATION) String token,
      );

  @GET(ENDPOINT_GET_PAYMENT_TYPES)
  Future<GetPaymentTypesResponse> getPaymentTypes(
      @Header(HEADER_KEY_AUTORIZATION) String token,
      );

  @GET(ENDPOINT_GET_CINEMA)
  Future<GetCinemaResponse> getCinemas(
      @Query(PARAM_LATEST_TIME) String latestTime,
      );

  @GET(ENDPOINT_SEATING_PLAN)
  Future<GetSeatingPlanByShowTimeResponse> getSeatingPlanByShowTime(
      @Header(HEADER_KEY_AUTORIZATION) String token,
      @Query(PARAM_TIMESLOT_ID) String cinemaDayTimeSlotId,
      @Query(PARAM_BOOKING_DATE) String bookingDate,
      ); 

}
