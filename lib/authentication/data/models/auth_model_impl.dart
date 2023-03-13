import 'package:the_movie_booking/authentication/data/models/auth_model.dart';
import 'package:the_movie_booking/authentication/network/data_agents/auth_data_agent.dart';
import 'package:the_movie_booking/authentication/network/data_agents/auth_data_agent_impl.dart';
import 'package:the_movie_booking/authentication/network/response/get_otp_response.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';

class AuthModelImpl extends AuthModel{

  static final AuthModelImpl _singleton = AuthModelImpl._internal();

  factory AuthModelImpl() {
    return _singleton;
  }

  AuthModelImpl._internal();

  final AuthDataAgent _dataAgent = AuthDataAgentImpl();
  @override
  Future<GetOTPResponse> getOTP(String phone) {
    return _dataAgent.getOTP(phone);
  }

  @override
  Future<SignInWithPhoneResponse> getSignInWithPhone(String phone, String otp) {
    return _dataAgent.getSignInWithPhone(phone, otp);
  }
  
}