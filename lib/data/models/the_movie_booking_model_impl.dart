import 'package:the_movie_booking/data/data_vos/cinema_color_config_vo.dart';
import 'package:the_movie_booking/data/data_vos/cinema_vo.dart';
import 'package:the_movie_booking/data/data_vos/color_vo.dart';
import 'package:the_movie_booking/data/data_vos/time_slot_vo.dart';
import 'package:the_movie_booking/data/models/the_movie_booking_model.dart';
import 'package:the_movie_booking/persistence/daos/color_dao.dart';

import '../../network/data_agents/movie_data_agent.dart';
import '../../network/data_agents/movie_data_agent_impl.dart';
import '../../network/response/checkout_request.dart';
import '../../network/response/checkout_response.dart';
import '../../network/response/get_banners_response.dart';
import '../../network/response/get_cinema_and_show_time_by_date_response.dart';
import '../../network/response/get_cinema_response.dart';
import '../../network/response/get_cities_response.dart';
import '../../network/response/get_config_response.dart';
import '../../network/response/get_movie_details_response.dart';
import '../../network/response/get_movies_response.dart';
import '../../network/response/get_otp_response.dart';
import '../../network/response/get_payment_types_response.dart';
import '../../network/response/get_snack_category_response.dart';
import '../../network/response/get_snacks_response.dart';
import '../../network/response/logout_response.dart';
import '../../network/response/sign_in_with_phone_response.dart';
import '../../persistence/daos/city_dao.dart';
import '../../persistence/daos/user_data_dao.dart';
import '../data_vos/cities_vo.dart';
import '../data_vos/seat_vo.dart';
import '../data_vos/user_vo.dart';

class TheMovieBookingModelImpl extends TheMovieBookingModel {
  static final TheMovieBookingModelImpl _singleton =
      TheMovieBookingModelImpl._internal();

  factory TheMovieBookingModelImpl() {
    return _singleton;
  }

  TheMovieBookingModelImpl._internal();

  final MovieDataAgent _dataAgent = MovieDataAgentImpl();
  final UserDataDao _userDataDao = UserDataDao();
  final CityDao _cityDao = CityDao();
  final ColorDao _colorDao = ColorDao();

  @override
  Future<GetOTPResponse> getOTP(String phone) {
    return _dataAgent.getOTP(phone);
  }

  /// Network

  @override
  Future<SignInWithPhoneResponse> getSignInWithPhone(String phone, String otp) {
    return _dataAgent.getSignInWithPhone(phone, otp).then((response) {
      if (response.code == 201) {
        _userDataDao.saveUserData(response);
      }
      return response;
    });
  }

  @override
  Future<GetCitiesResponse> getCities() {
    return _dataAgent.getCities().then((response) {
      if (response.code == 200) {
        _cityDao.saveAllCities(response.data ?? []);
      }
      return response;
    });
  }

  @override
  Future<GetBannersResponse> getBanners() {
    return _dataAgent.getBanners();
  }

  @override
  Future<GetMoviesResponse> getComingSoonMovies(String status) {
    return _dataAgent.getComingSoonMovies(status);
  }

  @override
  Future<GetMoviesResponse> getNowShowingMovies(String status) {
    return _dataAgent.getNowShowingMovies(status);
  }

  @override
  Future<GetMovieDetailsResponse> getMovieDetails(int movieId) {
    return _dataAgent.getMovieDetails(movieId);
  }

  @override
  Future<GetCinemaAndShowTimeByDateResponse> getCinemaAndShowTimeByDate(
      String date, String token) {
    return _dataAgent.getCinemaAndShowTimeByDate(date, token).then((response) {
      List<CinemaVO>? cinemaList = response.data;
      List<ColorVO>? colorList = _colorDao.getAllColors();
      for (int c = 0; c < cinemaList!.length; c++) {
        List<TimeSlotsVO>? timeList = cinemaList[c].timeSlots!;
        for (int t = 0; t < timeList.length; t++) {
          for (int cc = 0; cc < colorList.length; cc++) {
            if (timeList[t].status == colorList[cc].id) {
              timeList[t].color = colorList[cc].color;
            }
          }
        }
      }
      return response;
    });
  }

  @override
  void clearUserData() {
    _userDataDao.clearUserData();
  }

  @override
  Future<void> getConfigurations() async {
    _dataAgent.getConfigurations().then((value) {
      List<ColorVO>? colorList;
      colorList =
          List<ColorVO>.from(value![1].value.map((x) => ColorVO.fromJson(x)));
      _colorDao.saveAllColors(colorList);
    });
  }

  @override
  Future<LogoutResponse> userLogout(String token) {
    return _dataAgent.userLogout(token);
  }

  @override
  Future<GetPaymentTypesResponse> getPaymentTypes(String token) {
    return _dataAgent.getPaymentTypes(token);
  }

  @override
  Future<GetCinemaResponse> getCinemas(String latestTime, String userToken) {
    return _dataAgent.getCinemas(latestTime, userToken);
  }

  /// Database

  @override
  UserVO? getUserDataFromDatabase() {
    return _userDataDao.getUserData();
  }

  @override
  Future<List<CitiesVO>?> getCitiesFromDatabase() {
    return Future.value(_cityDao.getAllCities());
  }

  @override
  Future<List<List<SeatVO>?>> getSeatingPlan(
      String token, String cinemaDayTimeSlotId, String bookingDate) {
    return _dataAgent
        .getSeatingPlan(cinemaDayTimeSlotId.toString(), bookingDate, token)
        .then((seatResponse) {
      for (int i = 0; i < seatResponse.data.length; i++) {
        seatResponse.data[i]?.insert(5, SeatVO(5, 'space', '', '', 0));
        seatResponse.data[i]?.insert(6, SeatVO(6, 'space', '', '', 0));
        seatResponse.data[i]?.insert(11, SeatVO(11, 'space', '', '', 0));
        seatResponse.data[i]?.insert(12, SeatVO(12, 'space', '', '', 0));
      }
      return seatResponse.data
          .map((seatList) => seatList?.map((seat) {
                seat.isSelected = false;
                return seat;
              }).toList())
          .toList();
    });
  }

  @override
  Future<GetSnackCategoryResponse> getSnackCategory(String token) {
    return _dataAgent.getSnackCategory(token);
  }

  @override
  Future<GetSnacksResponse> getSnacks(String categoryId, String token) {
    return _dataAgent.getSnacks(categoryId, token).then((value) {
      value.data
          ?.map(
            (e) => e.quantity = 0,
          )
          .toList();
      return value;
    });
  }

  @override
  Future<CheckoutResponse> checkoutRequest(
      String token, CheckOutRequest checkOutRequest) {
    return _dataAgent.checkoutRequest(token, checkOutRequest);
  }
}
