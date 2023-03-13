import 'package:the_movie_booking/authentication/network/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:the_movie_booking/authentication/network/response/get_otp_response.dart';
import 'package:the_movie_booking/authentication/network/response/sign_in_with_phone_response.dart';

part 'auth_api.g.dart';
@RestApi(baseUrl : BASE_URL)
abstract class AuthApi{
factory AuthApi(Dio dio) = _AuthApi;

@POST(ENDPOINT_GET_OTP)
Future<GetOTPResponse> getOTP(
    @Field('phone') String phone,
    );

  @POST(ENDPOINT_GET_SIGN_IN_WITH_PHONE)
Future<SignInWithPhoneResponse> signInWithPhone(
    @Field('phone') String phone,
    @Field('otp') String otp,
    );
}