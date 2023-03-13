import '../response/get_otp_response.dart';
import '../response/sign_in_with_phone_response.dart';

abstract class AuthDataAgent {
  Future<GetOTPResponse> getOTP(String phone);

  Future<SignInWithPhoneResponse> getSignInWithPhone(
    String phone,
    String otp,
  );
}
