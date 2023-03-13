import 'package:dio/dio.dart';
import 'package:the_movie_booking/authentication/network/auth_api.dart';
import 'package:the_movie_booking/authentication/network/data_agents/auth_data_agent.dart';
import 'package:the_movie_booking/authentication/network/response/get_otp_response.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';

class AuthDataAgentImpl extends AuthDataAgent {
  late AuthApi mApi;

  static final AuthDataAgentImpl _singleton = AuthDataAgentImpl
      ._internal(); //assign private constructor to class level variable

  factory AuthDataAgentImpl() {
    return _singleton;
  } // assign var in factory constructor

  AuthDataAgentImpl._internal() {
    final dio = Dio();
    mApi = AuthApi(dio);
  } // private named constructor

  @override
  Future<GetOTPResponse> getOTP(String phone) {
    return mApi.getOTP(phone);
  }

  @override
  Future<SignInWithPhoneResponse> getSignInWithPhone(String phone, String otp) {
    return mApi.signInWithPhone(phone, otp);
  }
}
