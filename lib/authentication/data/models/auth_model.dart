import 'package:the_movie_booking/authentication/network/response/get_otp_response.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';

abstract class AuthModel {
  Future<GetOTPResponse> getOTP(String phone);

  Future<SignInWithPhoneResponse> getSignInWithPhone(
      String phone,
      String otp,
      );
}