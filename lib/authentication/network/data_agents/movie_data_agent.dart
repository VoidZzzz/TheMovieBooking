import 'package:the_movie_booking/authentication/network/response/get_snack_category_response.dart';

import '../response/get_banners_response.dart';
import '../response/get_cinema_and_show_time_by_date_response.dart';
import '../response/get_cinema_response.dart';
import '../response/get_cities_response.dart';
import '../response/get_config_response.dart';
import '../response/get_movie_details_response.dart';
import '../response/get_movies_response.dart';
import '../response/get_otp_response.dart';
import '../response/get_payment_types_response.dart';
import '../response/get_seating_plan_by_showtime_response.dart';
import '../response/get_snacks_response.dart';
import '../response/logout_response.dart';
import '../response/sign_in_with_phone_response.dart';

abstract class MovieDataAgent {
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

  Future<GetCinemaResponse> getCinemas(String latestTime, String userToken);

  Future<GetSeatingPlanByShowTimeResponse> getSeatingPlan(String cinemaDayTimeSlotId, String bookingDate, String token);

  Future<GetSnacksResponse> getSnacks(String categoryId, String token);

  Future<GetSnackCategoryResponse> getSnackCategory(String token);

}
