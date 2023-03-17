import 'package:the_movie_booking/authentication/data/data_vos/cities_vo.dart';
import 'package:the_movie_booking/authentication/data/data_vos/user_vo.dart';
import 'package:the_movie_booking/authentication/network/response/get_cinema_and_show_time_by_date_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_cinema_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_config_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_otp_response.dart';
import 'package:the_movie_booking/authentication/network/response/get_payment_types_response.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';

import '../../network/response/get_banners_response.dart';
import '../../network/response/get_cities_response.dart';
import '../../network/response/get_movie_details_response.dart';
import '../../network/response/get_movies_response.dart';
import '../../network/response/logout_response.dart';

abstract class TheMovieBookingModel {
  Future<GetOTPResponse> getOTP(String phone);

  Future<SignInWithPhoneResponse> getSignInWithPhone(
      String phone,
      String otp,
      );

  Future<GetCitiesResponse> getCities();

  Future<GetBannersResponse> getBanners();

  Future<GetMoviesResponse> getNowShowingMovies(String status);

  Future<GetMoviesResponse> getComingSoonMovies(String status);

  Future<GetMovieDetailsResponse> getMovieDetails(int movieId);

  Future<GetCinemaAndShowTimeByDateResponse> getCinemaAndShowTimeByDate(String date, String token);

  Future<GetConfigResponse> getConfigurations();

  Future<LogoutResponse> userLogout(String token);

  Future<GetPaymentTypesResponse> getPaymentTypes(String token);

  Future<GetCinemaResponse> getCinemas(String latestTime);

  /// Database
  UserVO? getUserDataFromDatabase();
 Future<List<CitiesVO>?> getCitiesFromDatabase();
 void clearUserData();
}