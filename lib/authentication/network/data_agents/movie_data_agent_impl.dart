import 'package:dio/dio.dart';
import 'package:the_movie_booking/authentication/network/api_constants.dart';
import 'package:the_movie_booking/authentication/network/response/get_banners_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_cinema_and_show_time_by_date_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_cinema_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_config_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_movie_details_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_movies_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_payment_types_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_seating_plan_by_showtime_response.dart';
import 'package:the_movie_booking/authentication/network/response/logout_response.dart';
import 'package:the_movie_booking/authentication/network/the_movie_booking_api.dart';
import 'package:the_movie_booking/authentication/network/data_agents/movie_data_agent.dart';
import 'package:the_movie_booking/authentication/network/response/get_cities_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_otp_response.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';

class MovieDataAgentImpl extends MovieDataAgent {
  late TheMovieBookingApi mApi;

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl
      ._internal(); //assign private constructor to class level variable

  factory MovieDataAgentImpl() {
    return _singleton;
  } // assign var in factory constructor

  MovieDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieBookingApi(dio);
  } // private named constructor

  @override
  Future<GetOTPResponse> getOTP(String phone) {
    return mApi.getOTP(phone);
  }

  @override
  Future<SignInWithPhoneResponse> getSignInWithPhone(String phone, String otp) {
    return mApi.signInWithPhone(phone, otp);
  }

  @override
  Future<GetCitiesResponse> getCities() {
    return mApi.getCities();
  }

  @override
  Future<GetBannersResponse> getBanners() {
    return mApi.getBanners();
  }

  @override
  Future<GetMoviesResponse> getNowShowingMovies(String status) {
    return mApi.getNowShowingMovies(status);
  }

  @override
  Future<GetMoviesResponse> getComingSoonMovies(String status) {
    return mApi.getComingSoonMovies(status);
  }

  @override
  Future<GetMovieDetailsResponse> getMovieDetails(int movieId) {
    return mApi.getMovieDetails(movieId.toString());
  }

  @override
  Future<GetCinemaAndShowTimeByDateResponse> getCinemaAndShowTimeByDate(String date, String token) {
    return mApi.getCinemaAndShowTimeByDate(token, date);
  }

  @override
  Future<GetConfigResponse> getConfigurations() {
    return mApi.getConfigurations();
  }

  @override
  Future<LogoutResponse> userLogout(String token) {
    return mApi.userLogOut(token);
  }

  @override
  Future<GetPaymentTypesResponse> getPaymentTypes(String token) {
    return mApi.getPaymentTypes(token);
  }

  @override
  Future<GetCinemaResponse> getCinemas(String latestTime) {
    return mApi.getCinemas(latestTime);
  }

  @override
  Future<GetSeatingPlanByShowTimeResponse> getSeatingPlan(String cinemaDayTimeSlotId, String bookingDate, String token) {
    return mApi.getSeatingPlanByShowTime(
        token, cinemaDayTimeSlotId.toString(), bookingDate);
  }
}
